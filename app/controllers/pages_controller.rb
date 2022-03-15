class PagesController < ApplicationController
    
    def home
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

        @jour = ( (@depart).to_date - (@arrive).to_date ).to_i

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
        #@logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        #@log_disponible= Logement.near(@city, 50)
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", @city, @arrive, @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", @city, @arrive, @depart, @voyageur, @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", @city, @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
    end

    def guadeloupe
        @lat_gdp  = 16.265
        @lng_gdp = -61.55099999999999
        @depart = Date.today+30
        @arrive = Date.today
        @voyageur = 2
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Guadeloupe",  @arrive,  @depart, @voyageur,  @depart,  @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?", "Guadeloupe",  @arrive,  @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Guadeloupe",  @arrive,  @depart, @voyageur,  @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Guadeloupe",  @arrive,  @depart, @voyageur,  @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def san_francisco
        @lat_sfc  = 37.7749295
        @lng_sfc = -122.4194155
        @depart = Date.today+30
        @arrive = Date.today
        @voyageur = 2
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "San Francisco, Californie, États-Unis",  @arrive,  @depart, @voyageur,  @depart,  @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "San Francisco, Californie, États-Unis",  @arrive,  @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "San Francisco, Californie, États-Unis",  @arrive,  @depart, @voyageur,  @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "San Francisco, Californie, États-Unis",  @arrive,  @depart, @voyageur,  @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def paris
        @lat_paris  = 48.856614
        @lng_paris = 2.3522219
        @depart = Date.today+30
        @arrive = Date.today
        @voyageur = 2
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Paris, France",  @arrive,  @depart, @voyageur,  @depart,  @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "Paris, France",  @arrive,  @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Paris, France",  @arrive,  @depart, @voyageur,  @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Paris, France", @arrive, @depart, @voyageur, @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

    def barcelone
        @lat_bcl  = 43873974
        @lng_bcl = 2.168568
        @depart = Date.today+30
        @arrive = Date.today
        @voyageur = 2
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "Barcelona, Espagne",  @arrive,  @depart, @voyageur,  @depart,  @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "Barcelona, Espagne",  @arrive,  @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "Barcelona, Espagne",  @arrive,  @depart, @voyageur,  @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "Barcelona, Espagne",  @arrive,  @depart, @voyageur,  @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
        
    end

    def new_york
        @lat_ny  = 40.7127753
        @lng_ny = -74.0059728
        @depart = Date.today+30
        @arrive = Date.today
        @voyageur = 2
        logements_non_disponible = Logement.joins(:bookings).where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking <= ? and bookings.end_booking >= ?", "New York, État de New York, États-Unis",  @arrive,  @depart, @voyageur,  @depart,  @arrive])
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings_count = ?",  "New York, État de New York, États-Unis",  @arrive,  @depart, @voyageur, 0]).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.start_booking > ?", "New York, État de New York, États-Unis",  @arrive,  @depart, @voyageur,  @depart])).or(Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and logements.voyageur >= ? and bookings.end_booking < ?", "New York, État de New York, États-Unis",  @arrive,  @depart, @voyageur,  @arrive])).left_outer_joins(:bookings).distinct.without(logements_non_disponible)
        puts @logements_disponible.inspect
    end

end 
