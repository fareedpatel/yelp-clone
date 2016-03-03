require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'is not valid with a rating of more than 5' do 
  	review = Review.new(ratings: 6)
  	expect(review).to have(1).error_on(:ratings)
  	expect(review).not_to be_valid
  end
end
