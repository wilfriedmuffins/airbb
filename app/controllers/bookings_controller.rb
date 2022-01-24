class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index
        @bookings = Booking.all
    end

    def new
        @booking = Booking.new
    end

    def show
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.logement = Logement.find(params[:logement_id])
        @booking.user = current_user
        @logement = Logement.find(params[:logement_id])
        @jour = (@booking.end_booking-@booking.start_booking).to_i

        puts @jour.inspect

        @booking.t_price = @jour*@logement.price

        if @booking.save
            flash[:notice] = "booking save"
            redirect_to booking_path(@booking) 
        else
            flash[:alert] = "booking non save, verifier les dates et/ou le nombre de voyageur"
            redirect_to page_path(@logement)
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
        @booking = Booking.find(params[:id])
    end
end