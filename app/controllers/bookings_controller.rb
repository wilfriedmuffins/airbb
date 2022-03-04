class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy] #

    def index
        if current_user.admin? == false
            redirect_to root_path
        else
            @bookings = Booking.all
        end
    end

    def new
        @booking = Booking.new
    end

    def show

    end

    def create
        if user_signed_in?
            @booking = Booking.new(booking_params)
            @booking.logement = Logement.find(params[:logement_id])
            @booking.user = current_user
            @logement = Logement.find(params[:logement_id])
            @jour = (@booking.end_booking-@booking.start_booking).to_i

            @booking.t_price = @jour*@logement.price

            if @booking.save
                flash[:notice] = "booking save"
                redirect_to booking_path(@booking) 
            else
                flash[:alert] = "booking non save, verifier les dates et/ou le nombre de voyageur"
                redirect_to page_path(@logement)
            end
        else
            
        end
        
    end

    def edit
    end

    def update
        if @booking.update(booking_params)
            redirect_to booking_path(@booking)
        else
            render :new
        end
    end

    def destroy
        @booking.destroy
        redirect_to root_path
    end

    private

    def booking_params
        params.require(:booking).permit(:start_booking, :end_booking, :voyageur, :t_price)
    end


    def set_booking
        @booking1 = Booking.find(params[:id])

        if current_user.id == @booking1.user_id || current_user.admin?
            @booking = Booking.find(params[:id])
        else
            redirect_to root_path
        end
    end
end