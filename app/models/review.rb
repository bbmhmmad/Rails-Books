class Review < ActiveRecord::Base
  belongs_to :text
  belongs_to :user
end
