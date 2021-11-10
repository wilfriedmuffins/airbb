class PagesController < ApplicationController
    
    def home
    end

    def show
        @booking = Booking.new
        @logement = Logement.find(params[:id])
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        @markers = params[:markers]
    end

    def search
        @city = params[:city] 
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        
        @logements = Logement.includes(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and voyageur >= ?", @city, @arrive, @depart, @voyageur])  
        @logements_non_disponible = []
        @logements_disponible = []

        @logements.each do |logement|
            if logement.bookings.empty? or !logement.bookings.where(["(start_booking >= ? and start_booking <= ?) and (end_booking >= ? and end_booking <= ?)", @arrive, @depart, @arrive, @depart])
                @logements_disponible.push(logement)
            end
        end
    end

end