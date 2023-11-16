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

  When /^I visit the sign up page$/ do
    visit new_user_registration_path
  end
  
  When /^I enter my signup info$/ do
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
  end

  And /I should see homepage has Post new scam/ do
    expect(current_path).to eq(scams_path)
    expect(page).to have_content 'Post new scam'
  end

  Given /^I am an admin user$/ do
    @admin_user = User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password', is_admin: true)
  end

  When /^I enter my email and password of admin account$/ do
    fill_in 'Email', with: @admin_user.email
    fill_in 'Password', with: 'password'
  end