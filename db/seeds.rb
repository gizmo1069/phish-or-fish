# seeds.rb

# Create Users
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}",
    is_admin: i.zero? # First user will be an admin
  )
end

# Create Scam posts
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
    user_id: User.find_by(email: "user#{i + 1}@example.com").id
  )
end

ScamArticle.create!(
  title: "Phone Scams",
  body: "These scams typically involve the scammer calling you and pretending to be from a legitimate company or organization, such as a bank, government agency, or utility company. They may say that there is a problem with your account and that you need to provide them with your personal information or credit card number to fix it. Embassy/citizenship scams: The scammer will call you and claim to be from your Embassy or US Homeland Security. They may say your personal information is being used to commit crimes and there is a warrant in your name. You will be asked to open a video app and remain monitored on video to prove your innocence. You may also be asked to pay large sums of money for a “bail bond” with the promise it will be returned later. In these cases, you will be asked to send more and more money until you realize it’s a scam and communication is ended. Tech support / financial institute scams: The scammer will call you and claim to be from a company. They will say that there is a problem with your computer or account and that you need to give them remote access to fix it. Once they have remote access, they can steal your personal information or install malware on your computer to learn passwords. IRS scams: The scammer will call you and claim to be from the IRS. They will say that you owe money in taxes and that you need to pay immediately. They may also threaten to arrest you if you don't pay.",
  author: "Sam",
  published_at: "2023-11-14"
)