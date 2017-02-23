class UsersController < ApplicationController
	before_action :pop_session, only:[:index]
	before_action :check_login, except: [:index,:login,:create]

	def index

	end

	def create
		user=User.new(user_params)
		if user.save
			session[:user_id]=user.id
			redirect_to texts_path
		else
			flash[:errors]=user.errors.full_messages
			redirect_to users_path
		end
	end

	def login
		user=User.find_by(email: login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to texts_path
		else
			flash[:notice] = 'Invalid credentials'
			redirect_to users_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:username,:email,:password,:password_confirmation)
	end

	def login_params
		params.require(:user).permit(:email,:password)
	end

	def check_login
		if session[:user_id] 

		else
			flash[:notice] = "You must be logged in to access this section"
			redirect_to users_path
		end
	end

	def pop_session
		session[:user_id]=nil
	end


end
