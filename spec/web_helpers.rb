def create_link(title:, url:, tag: nil)
  visit('/links')
  click_link 'Add link'
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tag unless tag.nil?
  click_button 'Add'
end

def sign_up
  visit '/users/new'
  fill_in :email,    with: 'joemaidman@gmail.com'
  fill_in :password, with: 'password'
  click_button 'Sign Up'
end