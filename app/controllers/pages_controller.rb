class PagesController < ApplicationController
    def home
    end

    def create
        #recupérer l'email l'user
        user = User.find_by(email: params[:email])
            
        # .present? si la variable est no nil 
        if user.present? && user.authenticate(params[:password])
            session[:user_id]= user.id
            #flash[notice] = "bonjour vous étes connected?"
            redirect_to root_path, notice: "bonjour vous étes connecté deh!"
        else 
            flash[:alert] = "email ou mot de passe invalide" 
            render :home
        end    
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
