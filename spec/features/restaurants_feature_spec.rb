require 'rails_helper'

feature 'restaurants' do 
  
    context 'no restaurants have been added' do
      
      scenario 'should display a prompt to add a restaurant' do
        visit '/restaurants'
        expect(page).to have_content('no restaurants added yet')
        expect(page).to have_link ('Add a restaurant')
      end
    end

  context 'At least one restaurant has been added' do
      
  before(:each) do
     Restaurant.create name: 'KFC' 
  end
  
  context 'restaurants have been added' do
    
    scenario 'adding a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'no restaurants added yet'
    end
  end
  
  context 'User can create a new restaurant' do
    
    scenario 'prompts the user to fill out a form, then displays the restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: "Pret a Manger"
      click_button 'Create Restaurant'
      expect(page).to have_content "Pret a Manger"
      expect(current_path).to eq '/restaurants'
    end
  end
  
  context 'Viewing restaurants' do
    
    let!(:pret) {Restaurant.create(name: 'Pret a Manger')}
    
    scenario 'User can see restaurant\'s details' do
      visit '/restaurants'
      click_link 'Pret a Manger'
      expect(page).to have_content 'Pret a Manger'
      expect(current_path).to eq "/restaurants/#{pret.id}"
    end
  end

  context 'updating restaurants' do
    
    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq '/restaurants' 
    end
  end

  context 'deleting restaurants' do

    scenario 'a user can delete a restaurant' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully' 
    end
  end
  
  context 'validations' do
    
    scenario 'User cannot create a duplicate restaurant' do
    visit '/restaurants'
    click_link "Add a restaurant"
    fill_in 'Name', with: 'KFC'
    click_button "Create Restaurant"
    expect(page).to have_content "Restaurant already exists"
    expect(current_path).to eq '/restaurants/new'
    end
  end

 end
end
