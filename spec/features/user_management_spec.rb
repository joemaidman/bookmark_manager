feature 'User sign up' do
  email = "joemaidman@gmail.com"
  email_wrong = "joemaidman@gmail"
  password = "password"
  password_wrong = "password2"
  
  scenario 'I can sign up as a new user' do
    sign_up(email:email, password: password)
    expect(page).to have_content("Welcome, #{email}")
    expect(User.first.email).to eq(email)
    expect(User.count).to eq(1)
  end

   scenario 'User is not signed up if passwords do not match' do
      expect {  sign_up(email:email, password: password,
                      password_confirm: password_wrong) 
                    }.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content "Password and confirmation password did not match!"
  end

  scenario 'cannot sign-up with an empty email address' do
    expect{ sign_up(email: nil, password: password )}.not_to change(User, :count)
  end

   scenario 'cannot sign-up with an invalid email addres' do
    expect{ sign_up(email: email_wrong, password: password )}.not_to change(User, :count)
  end
end