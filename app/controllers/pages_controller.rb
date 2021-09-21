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

    def show
        @logement = Logement.find(params[:id])
    end

    def search
        @city = params[:city]
        @depart = params[:depart]
        @arrive = params[:arrive]
        @voyageurs = params[:voyageurs]
        @logements_disponible = Logement.where(["city = ? and start_date_of_availability <= ? and end_date_of_availability >= ? and voyageur = ?",@city, @arrive, @depart, @voyageurs])#(["city = ? and start_date_of_availability >= ? and end_date_of_availability = ? and voyageur = ?",@city, @arrive, @depart, @voyageurs])
        #@latlng = Logement.where(["city = ? and start_date_of_availability = ? and end_date_of_availability = ? and voyageur = ?",@city, @arrive, @depart, @voyageurs]).pluck(:latitude, :longitude)
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    # private

    # def logement_params
    #     params.require(:logement).permit(:title, :adresse, :zipcode, :city, :start_date_of_availability, :end_date_of_availability, :voyageur)
    # end

end
