
feature 'User sign up' do
  email = "joemaidman@gmail.com"
  password = "password"
  password_wrong = "password2"
  scenario 'I can sign up as a new user' do
    sign_up(email:email, password: password)
    expect(page).to have_content("Welcome, #{email}")
    expect(User.first.email).to eq(email)
    expect(User.count).to eq(1)
  end

   scenario 'User is not signed up if passwords do not match' do
   sign_up(email:email, password: password,password_confirm: password_wrong)
    expect(User.count).to eq(0)
  end
end