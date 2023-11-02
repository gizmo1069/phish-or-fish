Given /the following scams exist/ do |scam_table|
  scam_table.hashes.each do |scam|
    Scam.create scam
  end
end

Then /I should see all the scams/ do
  # Make sure that all the movies in the app are visible in the table
  Scam.all.each do |scam|
    step %{I should see "#{scam.title}"}
  end
end

When('I update the scam post details') do
  # Fill in the form with new scam post details
  fill_in 'Title', with: 'Updated Title'
  # Add other fields as needed
end

Then('I should see the updated details of the scam post') do
  expect(page).to have_content('Updated Title')
  # Check for other updated details as needed
end

When('I click on {string}') do |link_name|
  click_on link_name
end

Then('I should see the alert with the message {string}') do |message|
  expect(page.driver.browser.switch_to.alert.text).to eq(message)
end

When('I fill in the scam post details') do
  fill_in 'Title', with: 'New Scam Title'
  fill_in 'Description', with: 'Description of the scam...'
  fill_in 'Zipcode', with: '10025'
end