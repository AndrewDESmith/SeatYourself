class User < ActiveRecord::Base
  has_many :reservations
  has_many :restaurants
  has_secure_password
end
