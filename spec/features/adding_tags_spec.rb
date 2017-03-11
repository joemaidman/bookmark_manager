feature 'Adding a tag to a link' do
  
  title = 'Google'
  url = 'https://www.google.com'
  tag = "tag_one"

  title_two = 'BBC'
  url_two = 'https://www.bbc.co.uk'
  tag_two = "tag_two"

  title = 'Google'
  url = 'https://www.google.com'
  tag_multi_one = "tag one, tag two, tag three"

  scenario 'user adds a tag to a link' do
    create_link(title: title, url: url, tag: tag)
    link = Link.first
    expect(link.tags.map(&:tag)).to include(tag)
    expect(page).to have_text(tag)
  end

  scenario 'user adds multiple tag to a link' do
    create_link(title: title, url: url, tag: tag_multi_one)
    link = Link.first
    expect(link.tags.map(&:tag)).to include("tag one", "tag two")
  end

end