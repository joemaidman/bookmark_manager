describe "Feature" do

email = "joemaidman@gmail.com"
password = "password"

before(:each) do
    sign_up(email: email, password: password)
    sign_in(email: email, password: password)
  end

  feature 'create a new link' do
    title = 'Google'
    url = 'https://www.google.com'
    scenario 'user creates a new link' do
      create_link(title: title, url: url)
      expect(page).to have_content("#{title}")
    end
  end
  
end
