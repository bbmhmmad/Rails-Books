class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :posts
  has_many :comments

  validates :name, :username,:email,presence: true
  validates :password, length: { minimum: 8 }, :if => :password
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
