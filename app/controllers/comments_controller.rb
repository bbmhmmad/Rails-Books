class CommentsController < ApplicationController
	def create
		@forum=Forum.find(params[:forum])
		@post=Post.find(params[:post])
		Comment.create(comment_params.merge({user:User.find(session[:user_id]),post:@post}))
		redirect_to forum_path(@forum.text)
	end

	def show 
		@comment = Comment.find(params[:id])
		
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end
end
