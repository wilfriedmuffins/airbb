class PagesController < ApplicationController
    
    def home
    end

    def create   
    end

    def show
        @logement = Logement.find(params[:id])
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        @markers = params[:markers]
        @booking = Booking.new
    end

    def search
        @city = params[:city]
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and voyageur >= ?",@city, @arrive, @depart, @voyageur])
    end

end
