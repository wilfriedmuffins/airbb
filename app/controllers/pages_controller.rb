class PagesController < ApplicationController
    
    def home
        @latitude  = params[:latitude]
        @longitude  = params[:logitude]
        # puts @latitude.inspect
        # puts @longitude.inspect
    end

    def show
        @booking = Booking.new
        @comment = Comment.new
        @logement = Logement.find(params[:id])
        @comments = @logement.comments.page(params[:page]).per(6)
        
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
        
    end

    def search
        @city = params[:city]
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        @latitude = params[:latitude]
        @longitude = params[:longitude]
        # puts @latitude.inspect
        # puts @longitude.inspect
        logement_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", @city, @arrive, @depart, @voyageur, @depart, @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logement_non_disponible)
        puts @logements_disponible.inspect
    end

end