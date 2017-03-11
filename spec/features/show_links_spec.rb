describe "Feature" do

email = "joemaidman@gmail.com"
password = "password"

before(:each) do
     sign_up(email: email, password: password)
    sign_in(email: email, password: password)
  end

  feature 'show all links' do
    scenario 'show a list of all links on the links route' do
      visit '/links'
      Link.create(url:'http://www.bbc.co.uk/news', title: "BBC News")
      visit '/links'
      expect(page).to have_content('BBC News')
    end
  end

end