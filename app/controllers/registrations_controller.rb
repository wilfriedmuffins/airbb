class RegistrationsController < ApplicationController
    #registration=user
    def new
        @user = User.new
    end

    def show
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "new user #{@user.last_name} created !"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end