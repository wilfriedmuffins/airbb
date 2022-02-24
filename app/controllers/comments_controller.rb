class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def index
        @comments = Comment.all.page(params[:page]).per(10)
    end
    

    def create
        @comment = Comment.new(comment_params)
        @comment.logement = Logement.find(params[:logement_id])
        @comment.user = User.find(params[:user_id])
        if @comment.save
            flash[:notice] = "Ton commentaire est publié"
            redirect_to logement_path(@comment.logement)
        else
            flash[:alert] = "Ah tu as deja mis un commentaire!"
            redirect_to logement_path(@comment.logement)
        end
    end

    def show
        @logements = Logement.find(params[:id])

        @comments = @logements.comments.order(:created_at).page params[:page]
        puts @logements.inspect
    end
    
    private
        def comment_params
            params.require(:comment).permit(:body, :user_id)
        end
end
