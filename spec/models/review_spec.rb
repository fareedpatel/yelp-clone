describe Review, type: :model do
  it {is_expected.to belong_to :restaurant }
  
  it "cannot be given a rating higher than 5" do
    review = Review.create(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end