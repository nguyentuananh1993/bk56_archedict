class CommentsController < ApplicationController

	def create
		@users = User.all
		@comment = Comment.new(comment_params)
		@question = Question.find(params[:question_id])
		@comment.question_id = @question.id
		@comment.user_id = current_user.id
		@comment.save
		redirect_to question_path(@question)
	end
	private
	    def set_comment
	      @comment = Comment.find(params[:id])
	    end

	    def comment_params
	      params.require(:comment).permit(:question_id, :body)
	    end
end
