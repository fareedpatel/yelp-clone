def create_review(comment = "So so", rating = 3)
  click_link "Review KFC"
  fill_in "Comment", with: comment 
  choose 'review[rating]', option: rating 
  click_button "Submit"
end
