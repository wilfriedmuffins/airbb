class PagesController < ApplicationController
    
    def home
    end

    def show
        @booking = Booking.new
        @comment = Comment.new
        @logement = Logement.find(params[:id])#includes(:bookings)
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]

        date = (@depart.to_date-@arrive.to_date).to_i
        @total = (date*@logement.price).to_s

        puts @total.inspect
        @user_id = []

        @logement.bookings.each do |id|
            @user_id.push(id.user_id)
        end

        #puts @user_id.inspect
        @user_id.uniq!
        #puts @user_id.inspect
        #puts current_user.id
        
        @test = @user_id.include? current_user.id
        #puts @test.inspect
        
    end

    def search
        @city = params[:city].downcase.squish
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        logement_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", @city, @arrive, @depart, @voyageur, @depart, @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logement_non_disponible)
    end

end