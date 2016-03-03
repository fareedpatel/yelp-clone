require 'rails_helper'

RSpec.describe Restaurant, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"

  it 'is not valid with a name of less than three characters' do 
  	restaurant = Restaurant.new(name: "kf")
  	expect(restaurant).to have(1).error_on(:name)
  	expect(restaurant).not_to be_valid
  end

  it 'is not valid with a previously named restaurant' do
  	restaurant = Restaurant.create(name: "kfc")
    restaurant2 = Restaurant.new(name:"kfc")
  	expect(restaurant2).to have(1).error_on(:name)
  	expect(restaurant2).not_to be_valid
  end
end

