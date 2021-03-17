class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #sendemail
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "if an accont with that email was found, we have sent a link to reset your password"

    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "your token has expired. Please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(params_password)
            redirect_to sign_in_path, notice: " mot de pase reinitialisé, tu peux connecter "
        else
            render :edit
        end
    end

    private

    def params_password
        params.require(:user).permit(:password, :password_confirmation)
    end
end