describe "Feature" do

  feature 'create a new link' do
    title = 'Google'
    url = 'https://www.google.com'
    scenario 'user creates a new link' do
      create_link(title: title, url: url)
      expect(page).to have_content("Title: #{title}")
      expect(page).to have_content("URL: #{url}")
    end
  end
  
end
