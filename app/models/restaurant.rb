class Restaurant < ActiveRecord::Base
  
  validates :name, uniqueness: true, length: {minimum: 3}
  
  has_many :reviews, dependent: :destroy
  has_one :user
  

end
