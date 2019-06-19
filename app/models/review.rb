class Review < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :restaurant
  belongs_to :user
end
