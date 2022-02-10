class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def index
        if current_user.admin? == false
            redirect_to root_path
            flash[:danger] = "attention tu fais quoi la tu n'es pas l'admin"
        else
            @users = User.all

            puts params[:user_id].inspect
        end
    end

    def show
        @book = Booking.where(user_id: current_user.id)
        puts @book.inspect
    end
end

private

def set_user
    @user1 = User.find(params[:id])

    if current_user.id == @user1.id || current_user.admin?
        @user = User.find(params[:id])
    else
        redirect_to root_path
    end
end