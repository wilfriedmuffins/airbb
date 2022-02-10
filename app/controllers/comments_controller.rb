class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @logement = Logement.find(params[:logement_id])

        @comment.user_id = params[:user_id]
        puts params[:user_id].inspect

        @comment = @logement.comments.create!(comment_params)

        @double = @logement.comments.where(user_id: current_user.id).exists?

        if @double
            flash[:alert] = "commentaire non publique car nous avez déja mis un commentaire"
            redirect_to logement_path(@logement)
        elsif @comment.save
            redirect_to logement_path(@logement) 
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :user_id)
        end
end
