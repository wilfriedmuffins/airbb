class LogementsController < ApplicationController
    before_action :set_logement, only: [ :edit, :update, :destroy]
    helper_method :check_status

    def new
        @logement = Logement.new
    end

    def index
        if current_user.admin? == false
            redirect_to root_path
        else
            @logements = Logement.all
        end
    end

    def show
        @logement1 = Logement.find(params[:id])
        @user_id = []
        @logement1.bookings.each do |id|
            @user_id.push(id.user_id)
        end

        @user_id.uniq!
        @user_booked = @user_id.include? current_user.id

        #je suis ni le onwer ni l'admin ni booker => je ne peux voir le logement 
        if (current_user.id != @logement1.user_id) || (!current_user.admin) || (!@user_booked)
            redirect_to root_path
        else
            @logement = Logement.includes(:comments).find(params[:id])
        end

    end


    def create
        @logement = Logement.new(logement_params)
        @logement.user = current_user
        if @logement.save
            puts current_user.email.inspect
            LogementMailer.send_signup_email(current_user).deliver_now
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
        params.require(:logement).permit(:title, :adresse, :zipcode, :city, :latitude, :longitude, :start_date_of_availability, :end_date_of_availability, :voyageur, :description, :price, equipments: [], images: [])
    end

    def set_logement
        @logement = Logement.find(params[:id])
    end

    

    
end