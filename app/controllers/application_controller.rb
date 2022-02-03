class ApplicationController < ActionController::Base

helper_method :check_status


    def check_status(id)
        @booking = Booking.find(id)

        @debut = @booking.start_booking
        @fin = @booking.end_booking
        range = (@debut)..(@fin)

        #puts booking.start_booking
        #puts booking.end_booking
        puts range

        #en cours
        @check_date = range.include?(Date.today)
        puts @check_date.inspect

        if @check_date
            @status = "en_cours"
        elsif  @debut > Date.today
            @status = "futur_séjour"
        elsif @fin < Date.today
            @status = "séjour_effectué"
        end
        
    end

end