class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @logement = Logement.find(params[:logement_id])
        #@user = User.find()
        @comment.user_id = params[:user_id]
        #puts user_id
        @comment = @logement.comments.create!(comment_params)
        if @comment.save
            redirect_to logement_path(@logement)
        else
            flash[:alert] = "commentaire non save"
            puts current_user
            redirect_to logement_path(@logement)
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:body, :user_id)
        end
end
