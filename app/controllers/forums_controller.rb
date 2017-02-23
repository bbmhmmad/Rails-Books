class ForumsController < ApplicationController
	before_action :check_login

	def show
		@text=Text.find(params[:id])
	end

	private
	def check_login
		if session[:user_id]

		else
			flash[:errors] = ["You must be logged in to access this section"]
			redirect_to users_path
		end
	end
end
