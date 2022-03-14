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
            @logements = Logement.all.order(:id).page(params[:page]).per(15)
        end
    end

    def show
        @comment = Comment.new
        
        @logement1 = Logement.find(params[:id])
        @booked1 = @logement1.bookings.exists?(user_id: current_user.id)
        
        
        #je suis ni le onwer ni l'admin ni booker => je ne peux voir le logement 
        if ( @booked1 || (current_user.id == @logement1.user_id) ) || ( current_user.admin ) 
            @logement = Logement.includes(:comments).find(params[:id])
            @comments = @logement.comments.page(params[:page]).per((5))
            @booked = @logement1.bookings.exists?(user_id: current_user.id)
        else
            redirect_to root_path
        end
    end


    def create
        @logement = Logement.new(logement_params)
        @logement.user = current_user
        if @logement.save
            #puts current_user.email.inspect
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
        params.require(:logement).permit(:title, :adresse, :city, :latitude, :longitude, :start_date_of_availability, :end_date_of_availability, :voyageur, :description, :price, equipments: [], images: [], images_cache: [])
    end

    def set_logement
        @logement = Logement.find(params[:id])
    end

end
