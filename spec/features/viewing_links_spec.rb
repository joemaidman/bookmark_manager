feature 'Viewing links' do 
  title = 'Google'
  url = 'https://www.google.com'
  tag = "tag1"

  title_two = 'BBC'
  url_two = 'https://www.bbc.co.uk'
  tag_two = "tag2"

  scenario 'filter links by tag' do
    create_link(title: title, url: url, tag: tag)
    create_link(title: title_two, url: url_two, tag: tag_two)
    visit "/tags/#{tag_two}"
    within 'ul#links' do
      expect(page).not_to have_content(title)
      expect(page).to have_content(title_two)
    end
  end

end

