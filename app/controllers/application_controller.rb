class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :check_status, :current_user


    def check_status(id)
        @booking = Booking.find(id)

        @debut = @booking.start_booking
        @fin = @booking.end_booking
        range = (@debut)..(@fin)

        @check_date = range.include?(Date.today)

        if @check_date
            @status = "en_cours"
        elsif  @debut > Date.today
            @status = "futur_séjour"
        elsif @fin < Date.today
            @status = "séjour_effectué"
        end
        
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
    end

end