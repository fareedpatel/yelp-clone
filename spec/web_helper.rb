def create_review(comment = "So so", rating = 3)
  click_link "Review KFC"
  fill_in 'review[comment]', with: comment 
  choose 'review[rating]', option: rating 
  click_button "Submit"
end

def sign_up(username = 'test@ymail.com', password = 'supersecret', confirm_password = 'supersecret')
  visit '/'
  click_link "Sign Up"
  fill_in 'user[email]', with: 'test@ymail.com'
  fill_in 'user[password]', with: 'supersecret'
  fill_in 'user[password_confirmation]', with: 'supersecret'
  click_button "Sign up"
end

def log_in(username = 'test@ymail.com', password = 'supersecret')
  visit '/'
  click_link 'Log In'
  fill_in "user[email]", with: username
  fill_in 'user[password]', with: password
  click_button "Log in"
end
