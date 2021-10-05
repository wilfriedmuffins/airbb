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
        @logement.user = current_user
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
        redirect_to edit_user_registration_path
    end

    private

    def logement_params
        params.require(:logement).permit(:title, :adresse, :zipcode, :city, :latitude, :longitude, :start_date_of_availability, :end_date_of_availability, :voyageur)
    end
end