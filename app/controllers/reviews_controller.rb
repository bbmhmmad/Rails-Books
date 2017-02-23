class ReviewsController < ApplicationController
	before_action :check_login

	def show
		@text=Text.find(params[:id])
		@reviews=Review.where(text:@text)
		@five_star_reviews=@reviews.where(rating:5)
		@four_star_reviews=@reviews.where(rating:4)
		@three_star_reviews=@reviews.where(rating:3)
		@two_star_reviews=@reviews.where(rating:2)
		@one_star_reviews=@reviews.where(rating:1)
		puts 'REVIEWS', @reviews
	end

	def create
		@text=Text.find(params[:text])
		Review.create(review_params.merge({user:User.find(session[:user_id]),text:@text}))
		redirect_to review_path(@text)
	end

	private
		def check_login
			if session[:user_id] 

			else
				flash[:notice] = "You must be logged in to access this section"
				redirect_to users_path
			end
		end

		def review_params
			params.require(:review).permit(:title,:review,:rating)
		end
end
