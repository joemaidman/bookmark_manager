require './app'

describe "Feature" do

  feature 'show all links' do
    scenario 'show a list of all links on the links route' do
      visit '/links'
      Link.create(url:'http://www.bbc.co.uk/news', title: "BBC News")
      visit '/links'
      expect(page).to have_content('Title: BBC News')
      expect(page).to have_content('URL: http://www.bbc.co.uk/news')
    end
  end


end