# seeds.rb

# Create 5 users
5.times do |i|
    User.create!(
      email: "user#{i + 1}@example.com",
      password: 'password123',
      password_confirmation: 'password123'
    )
  end
  
  # Assuming User model exists and 5 users were created
  users = User.all
  
  # Create 5 scams
  users.each_with_index do |user, index|
    Scam.create!(
      user: user,
      title: "Scam Title #{index + 1}",
      description: "Scam Description #{index + 1}",
      category: "Category #{index + 1}",
      zipcode: "1000#{index}",
      url: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/#{133 + index}.png"
    )
  end
  