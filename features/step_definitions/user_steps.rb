Given /^I am a registered user$/ do
    @registered_user = User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end
  
  When /^I visit the login page$/ do
    visit new_user_session_path
  end
  
  When /^I enter my email and password$/ do
    fill_in 'Email', with: @registered_user.email
    fill_in 'Password', with: 'password'
  end
  
  And /I should see homepage has Post new scam/ do
    expect(current_path).to eq(scams_path)
    expect(page).to have_content 'Post new scam'
  end
