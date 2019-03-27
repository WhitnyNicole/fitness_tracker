class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password

  validates :name, :username, :email, presence: true
end
