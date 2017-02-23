class Forum < ActiveRecord::Base
  belongs_to :text
  has_many :posts
end
