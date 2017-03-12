def create_link(title:, url:, tag: nil)
  visit('/links')
  click_button 'Add link'
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tag unless tag.nil?
  click_button 'Add'
end

def sign_up(email:, password:, password_confirm: password)
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirm
  click_button 'Sign Up'
end

def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
end

def sign_out
    visit '/links'
    click_button 'Sign Out'
end
