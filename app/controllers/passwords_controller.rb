class PasswordsController < ApplicationController
    before_action :require_user_logged_in!

    def edit
    end

    def update
        if Current.user.authenticate(params[:current_password]) && Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated"
        else
            flash[:alert] = "mot de passe invalide"  if !Current.user.authenticate(params[:current_password])
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end