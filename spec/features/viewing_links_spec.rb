feature 'Viewing links' do

  title = 'Google'
  url = 'https://www.google.com'
  tag = "tag1"

  title_two = 'BBC'
  url_two = 'https://www.bbc.co.uk'
  tag_two = "tag2"

  email = "joemaidman@gmail.com"
  password = "password"

before(:each) do
    sign_up(email: email, password: password)
    sign_in(email: email, password: password)
  end

  scenario 'filter links by tag' do
    create_link(title: title, url: url, tag: tag)
    create_link(title: title_two, url: url_two, tag: tag_two)
    visit "/tags/#{tag_two}"
    expect(page).not_to have_content(title)
    expect(page).to have_content(title_two)
  end

end
