class RepliesController < ApplicationController

	def create
		@comment=Comment.find(params[:comment])
		Reply.create(reply_params.merge({user:User.find(session[:user_id]),comment:@comment}))
		redirect_to comment_path(@comment)
	end

	def show 
		@comment = Comment.find(params[:id])
		
	end

	private

	def reply_params
		params.require(:reply).permit(:reply)
	end

end
