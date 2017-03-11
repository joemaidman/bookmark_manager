describe "Feature" do

email = "joemaidman@gmail.com"
password = "password"
title = 'Google'
url = 'https://www.google.com'

before(:each) do
    sign_up(email: email, password: password)
    sign_in(email: email, password: password)
    create_link(title: title, url: url)
  end

  feature 'delete a link' do
    scenario 'user deletes a link' do
      click_button 'Delete'
      expect(page).not_to have_content("#{title}")
    end
  end
  
end
