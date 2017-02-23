class Text < ActiveRecord::Base
	has_many :reviews
	has_many :forums
	has_many :posts, through: :forums
	has_many :comments, through: :posts

	validates :title, :author,:subject,:chapter, presence: true
end
