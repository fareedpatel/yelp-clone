feature 'Reviews' do
  before(:each) do
     Restaurant.create name: 'KFC' 
  end
 
  context 'Adding reviews' do 
    scenario 'a user can add a review' do
      visit '/restaurants'
      create_review
      expect(page).to have_content "Review submitted"
      click_link 'KFC'
      expect(page).to have_content "So so, 3"
    end
  end

  context 'Average rating' do
    scenario 'is calculated and displayed' do
      visit('/restaurants')
      create_review("Terrible", 1)
      create_review("Excellent", 5)
      expect(page).to have_content "Average Rating: 3.0"
    end
  end
end

