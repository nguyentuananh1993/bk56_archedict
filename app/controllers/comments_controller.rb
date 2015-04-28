class CommentsController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@comment = @question.comments.create(params[:comment].permit(:name,:body))
		redirect_to question_path(@question)
	end
end
