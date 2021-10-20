class UsersController < ApplicationController
    def index
        if current_user.admin? == false
            flash[:danger] = "attention tu fais quoi la tu n'es pas l'admin"
            redirect_to root_path
        else
            @users = User.all
        end
    end

    def show
        @user = User.find(params[:id])
    end
end