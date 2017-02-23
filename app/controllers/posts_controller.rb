class PostsController < ApplicationController
	def create
		@forum=Forum.find(params[:forum])
		Post.create(post_params.merge({user:User.find(session[:user_id]),forum:@forum}))
		redirect_to forum_path(@forum.text)
	end

	private
	def post_params
		params.require(:post).permit(:post)
	end
end
