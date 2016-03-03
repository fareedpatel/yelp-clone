feature 'user can sign in and out' do
  
  context 'User is not signed in' do
    it 'should see a Sign in and Sign out link' do
      visit '/'
      expect(page).to have_content "Log In"
      expect(page).to have_content "Sign Up"
    end
  end
end