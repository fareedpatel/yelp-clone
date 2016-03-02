describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }
  
  it 'Duplicates cannot be created' do
    restaurant = Restaurant.create(name: "KFC")
    restaurant2 = Restaurant.create(name: "KFC")
    expect(restaurant2).to have(1).error_on(:name)
    expect(restaurant2).not_to be_valid
  end
  
  it 'Name has to have a minimum of 3 characters' do
    restaurant = Restaurant.create(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end