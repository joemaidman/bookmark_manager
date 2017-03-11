
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, joemaidman@gmail.com')
    expect(User.first.email).to eq('joemaidman@gmail.com')
    expect(User.count).to eq(1)
  end
end