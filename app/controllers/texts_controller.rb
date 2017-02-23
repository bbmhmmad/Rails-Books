class TextsController < ApplicationController
	
	before_action :check_login
	def index
		@user=User.find(session[:user_id])
		@titles=Text.pluck(:title).sort_by{|title| title.downcase}
		@authors=Text.pluck(:author).sort_by{|author| author.downcase}
		@subjects=Text.pluck(:subject).sort_by{|subject| subject.downcase}
		puts @titles
	end

	def sort
		if params[:sort]=='title'
			puts 'Hello' + params[:title]
			@texts=Text.where(["title= ?",params[:title]])
		
		elsif params[:sort]=='author'
			puts 'Hello' + params[:author]
			@texts=Text.where(["author= ?",params[:author]])

		elsif params[:sort]=='subject'
			puts 'Hello' + params[:subject]
			@texts=Text.where(["subject= ?",params[:subject]])
			
		end

	end

	def show
		@text=Text.find(params[:id])
		sum = 0.0
		@text.reviews.each {|review| sum+=review.rating}
		@book_rating=sum/@text.reviews.count
	end

	def info
		Genius.access_token = 'ec_Qx_11h9JPt_vdMfsauIEmMEzPeWF_MBshLsT_5-cxErVQUQXR3zpEsKZscCQK'
		response = HTTParty.get('https://genius.com/Henry-david-thoreau-economy-annotated')
		puts ('RESPONSE')
		puts response.body
		render :info
	end
end

private

	def check_login
		if session[:user_id]

		else
			flash[:errors] = ["You must be logged in to access this section"]
			redirect_to users_path
		end
	end

	def title_params
		params.require(:text).permit(:title)
	end
