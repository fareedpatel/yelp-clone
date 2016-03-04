class Review < ActiveRecord::Base
  
  validates :rating, inclusion: { in: (1..5) }
  belongs_to :restaurant
  belongs_to :user
end
