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
      expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'cannot sign-up with an empty email address' do
    expect{ sign_up(email: nil, password: password )}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

   scenario 'cannot sign-up with an invalid email addres' do
    expect{ sign_up(email: email_wrong, password: password )}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end
  
  scenario 'cannot create a new account with the same email address' do
    sign_up(email:email, password: password)
    expect{sign_up(email:email, password: password)}.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User sign in' do
 let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'has correct email and password to login' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"

  end


  end
  