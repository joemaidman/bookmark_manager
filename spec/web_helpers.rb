def create_link(title:, url:, tag: nil)
  visit('/links')
  click_link 'Add link'
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tag unless tag.nil?
  click_button 'Add'
end