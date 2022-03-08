class PagesController < ApplicationController
    
    def home
        @city_paris = "Paris, France"
        # @city_guadeloupe = "Guadeloupe"
        # @city_san_francisco = "San Francisco, Californie, États-Unise"
        # @city_Barcelona = "Barcelona, Espagne"
        # @city_new_york= "New York, État de New York, États-Unis"

        # @latitude  = params[:latitude]
        # @longitude  = params[:logitude]

        # @latitude  = params[:latitude]
        # @longitude  = params[:logitude]

        # @latitude  = params[:latitude]
        # @longitude  = params[:logitude]

        # @latitude  = params[:latitude]
        # @longitude  = params[:logitude]

       
        


        # @lat_san_francisco  = 
        # @lng_san_francisco = 

        # @lat_paris  = 
        # @lng_paris = 
        # @lat_paris  = 
        # @lng_paris =  

        # @lat_paris  = 
        # @lng_san_francisco = 

        @latitude  = params[:latitude]
        @longitude  = params[:logitude]


        puts @latitude.inspect
        puts @longitude.inspect
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
        #@logement = Logement.near("Paris, France", 30)

        @city = params[:city]
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageur = params[:voyageur]
        @latitude = params[:latitude]
        @longitude = params[:longitude]
        puts @latitude.inspect
        puts @longitude.inspect
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", @city, @arrive, @depart, @voyageur, @depart, @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
    end

    def guadeloupe
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Guadeloupe", Date.today, Date.today+30, 1, Date.today+30, Date.today])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", "Guadeloupe", Date.today, Date.today+30, 1, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Guadeloupe", Date.today, Date.today+30, 1, Date.today+30])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Guadeloupe", Date.today, Date.today+30, 1, Date.today])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def san_francisco
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "San Francisco, Californie, États-Unis", Date.today, Date.today+30, 1, Date.today+30, Date.today])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "San Francisco, Californie, États-Unis", Date.today, Date.today+30, 1, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "San Francisco, Californie, États-Unis", Date.today, Date.today+30, 1, Date.today+30])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "San Francisco, Californie, États-Unis", Date.today, Date.today+30, 1, Date.today])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def paris
        @lat_paris  = 48.856614
        @lng_paris = 2.3522219
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Paris, France", Date.today, Date.today+30, 1, Date.today+30, Date.today])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "Paris, France", Date.today, Date.today+30, 1, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Paris, France", Date.today, Date.today+30, 1, Date.today+30])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Paris, France", Date.today, Date.today+30, 1, Date.today])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def barcelone
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Barcelona, Espagne", Date.today, Date.today+30, 1, Date.today+30, Date.today])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "Barcelona, Espagne", Date.today, Date.today+30, 1, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Barcelona, Espagne", Date.today, Date.today+30, 1, Date.today+30])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Barcelona, Espagne", Date.today, Date.today+30, 1, Date.today])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
        
    end

    def new_York
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "New York, État de New York, États-Unis", Date.today, Date.today+30, 1, Date.today+30, Date.today])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "New York, État de New York, États-Unis", Date.today, Date.today+30, 1, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "New York, État de New York, États-Unis", Date.today, Date.today+30, 1, Date.today+30])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "New York, État de New York, États-Unis", Date.today, Date.today+30, 1, Date.today])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

end 
