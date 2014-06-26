class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :user, through: :reservations
  belongs_to :user
  has_and_belongs_to_many :categories
end
