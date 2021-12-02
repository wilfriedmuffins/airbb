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
        puts current_user.id
        @book = Booking.where(user_id: current_user.id)

        @book.each do |logement| #= @book.logement_id

        end 
        
        # @book.each do |id|
        #     @user_id.push(id.user_id)
        # end

        puts @book.inspect
        #puts @logement.inspect
    end
end