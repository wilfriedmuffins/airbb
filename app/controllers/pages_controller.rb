class PagesController < ApplicationController
    
    def home
    end

    def show
        @booking = Booking.new
        @comment = Comment.new
        @logement = Logement.find(params[:id])
        
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]

        puts @depart.inspect
        puts @arrive.inspect
        puts @voyageur.inspect

        @jour = ( (@depart).to_date - (@arrive).to_date).to_i

        puts @jour

        @total = (@jour*@logement.price).to_s

        puts @total.inspect
        @user_id = []

        @logement.bookings.each do |id|
            @user_id.push(id.user_id)
        end
        
        @index = [0]
        
        @user_id.uniq!
        
        @test = @user_id.include? current_user.id
        
    end

    def search
        if user_signed_in?
            @city = params[:city].downcase.squish
            @depart = params[:depart]
            @arrive = params[:arrive]
            @voyageur = params[:voyageur]
            logement_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", @city, @arrive, @depart, @voyageur, @depart, @arrive])
            @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logement_non_disponible)
        else
            redirect_to new_user_session_path
        end
    end

end