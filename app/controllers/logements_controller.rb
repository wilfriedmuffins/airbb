class LogementsController < ApplicationController
    def new
        @logement = Logement.new
    end

    def index
        @logements = Logement.all
    end

    def create
        @logement = Logement.new(logement_params)
        if @logement.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @log = Logement.where("title = ?", params[:title])
    end

    private

    def logement_params
        params.require(:logement).permit(:title, :adresse, :start_date_of_availability, :end_date_of_availability, :voyageur)
    end
end