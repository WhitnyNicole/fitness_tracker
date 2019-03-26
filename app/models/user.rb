class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password

  validates :username, :email, presence: true
end
