class LogementsController < ApplicationController
    def new
        @logement = Logement.new
    end

    def index
        @logements = Logement.all
    end

    def show
        @logement = Logement.find(params[:id])
    end

    def create
        @logement = Logement.new(logement_params)
        if @logement.save
            redirect_to logement_path(@logement)
        else
            render 'new'
        end
    end

    def edit
        @logement = Logement.find(params[:id])
    end

    def update
        @logement = Logement.find(params[:id])

        if @logement.update(logement_params)
            redirect_to logement_path(@logement)
        else
            render :new
        end
    end

    def destroy
        @logement = Logement.find(params[:id])
        @logement.destroy
        redirect_to logements_path
    end

    def search
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageurs = params[:voyageurs]
        puts @depart.inspect
        puts @arrive.inspect
        puts @voyageurs.inspect
        @log = Logement.where(["start_date_of_availability = ? and end_date_of_availability = ? and voyageur = ?", @arrive, @depart, @voyageurs])
    end

    private

    def logement_params
        params.require(:logement).permit(:title, :adresse, :zipcode, :city, :lat, :lng, :start_date_of_availability, :end_date_of_availability, :voyageur)
    end
end