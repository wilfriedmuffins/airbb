class SessionsController < ApplicationController
    def new
    end

    def create
        #recupérer l'email l'user
        user = User.find_by(email: params[:email])

        # .present? si la variable est no nil 
        if user.present? && user.authenticate(params[:password])
            session[:user_id]= @user_id
            #flash[notice] = "bonjour vous étes connected?"

            redirect_to root_path, notice: "bonjour vous étes connecté deh!"
        else 

            redirect_to sign_in_path
        end    
        
    end

    def destroy
        session[:user_id] = nil
        
    end
end