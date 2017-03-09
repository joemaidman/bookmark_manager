require './app'

describe "Feature" do

  feature 'create a new link' do
    scenario 'user creates a new link' do
        visit('/links')
        click_link 'Add link'
        fill_in 'title', with: 'Google'
        fill_in 'url', with: 'https://www.google.com'
        fill_in 'tag', with: 'search engine'
        click_button 'Add'
        expect(current_path).to eq '/links'
        expect(page).to have_content("Title: Google")
        expect(page).to have_content("URL: https://www.google.com")
        link = Link.first
        expect(link.tags.map(&:tag)).to include('search engine')
        # expect(page).to have_text("search engine")
    end
    
end
end
