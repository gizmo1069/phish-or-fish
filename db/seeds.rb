# seeds.rb

# Create 5 users
5.times do |i|

  # For each user, create a scam with randomized categories and more realistic descriptions
  categories = ['phone', 'email', 'social media']
  scam_descriptions = [
    "Received a call saying I won a prize and needed to provide credit card info to claim.",
    "An email claiming to be from a bank, asking to click on a suspicious link to verify the account.",
    "A message on social media from an unknown profile promising easy money with a small investment.",
    "Phone call from 'IRS' claiming there's a lawsuit against me and demanding immediate payment.",
    "Email received with an attachment, claiming to be an invoice for a service I never used."
  ]

  Scam.create!(
    title: "Scam Report #{i + 1}: #{categories.sample.capitalize} Scam",
    description: scam_descriptions[i],
    category: categories.sample,
    zipcode: "#{10000 + i}",
    url: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/#{133 + i}.png",
  )
end
