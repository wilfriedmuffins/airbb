class LogementsController < ApplicationController
    before_action :set_logement, only: [ :edit, :update, :destroy]

    def new
        @logement = Logement.new
    end

    def index
        @logements = Logement.all
    end

    def show
        @logement = Logement.includes(:comments).find(params[:id])
        @user_id = []
        @logement.bookings.each do |id|
            @user_id.push(id.user_id)
        end

        #puts @user_id.inspect
        @user_id.uniq!
        puts @user_id.inspect
        puts current_user.id
        
        @test = @user_id.include? current_user.id
        puts @test.inspect
        
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
    end

    def update
        if @logement.update(logement_params)
            redirect_to logement_path(@logement)
        else
            render :new
        end
    end

    def destroy
        @logement.destroy
        redirect_to edit_user_registration_path
    end

    private

    def logement_params
        params.require(:logement).permit(:title, :adresse, :zipcode, :city, :latitude, :longitude, :start_date_of_availability, :end_date_of_availability, :voyageur, :price, images: [])
    end

    def set_logement
        @logement = Logement.find(params[:id])
    end
end