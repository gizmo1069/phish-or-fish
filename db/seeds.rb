# seeds.rb

# Create Users and Scams
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}",
    is_admin: i.zero? # First user will be an admin
  )

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


# Create scam articles
ScamArticle.create!(
  title: "Phone Scams",
  body: "<p>These scams typically involve the scammer calling you and pretending to be from a legitimate company or organization, such as a bank, government agency, or utility company. They may say that there is a problem with your account and that you need to provide them with your personal information or credit card number to fix it.&nbsp;</p>
  <ul>
  <li><strong>Embassy/citizenship scams:&nbsp;</strong>The scammer will call you and claim to be from your Embassy or US Homeland Security. They may say your personal information is being used to commit crimes and there is a warrant in your name. You will be asked to open a video app and remain monitored on video to prove your innocence. You may also be asked to pay large sums of money for a &ldquo;bail bond&rdquo; with the promise it will be returned later. In these cases, you will be asked to send more and more money until you realize it&rsquo;s a scam and communication is ended. <br />&nbsp;</li>
  <li><strong>Tech support / financial institute scams:&nbsp;</strong>The scammer will call you and claim to be from a company. They will say that there is a problem with your computer or account and that you need to give them remote access to fix it. Once they have remote access, they can steal your personal information or install malware on your computer to learn passwords. <br />&nbsp;</li>
  <li><strong>IRS scams:</strong>&nbsp;The scammer will call you and claim to be from the IRS. They will say that you owe money in taxes and that you need to pay immediately. They may also threaten to arrest you if you don't pay.</li>
  </ul>
  <p>Learn more:&nbsp;<a href='https://consumer.ftc.gov/articles/phone-scam' target='_blank' rel='noopener'>https://consumer.ftc.gov/articles/phone-scams</a>&nbsp;</p>",
  author: "Columbia CS Advising",
  published_at: "2023-11-14"
)

ScamArticle.create!(
  title: "How to Avoid and Recognize Scams",
  body: "<ul>
  <li>Never give out your personal information over the phone or email, unless you are sure of the identity of the person you are talking to.&nbsp;</li>
  <li>Be suspicious of any email or phone call that asks for your personal information or credit card number.&nbsp;</li>
  <li>Do not click on links in emails or text messages from people you don't know.&nbsp;</li>
  <li>Be careful about what information you share on social media.&nbsp;</li>
  <li>Keep your software up to date.&nbsp;</li>
  <li>Use strong passwords and change them regularly.&nbsp;</li>
  <li>If you think you have been scammed, you should report it to the authorities and to the company or organization that was impersonated. You should also keep a record of all the information you have about the scam, including the phone number, email address, and website address.&nbsp;</li>
  </ul>",
  author: "Columbia Public Safety",
  published_at: "2023-11-14"
)

ScamArticle.create!(
  title: "Protect yourself from Phishing",
  body: "Phishing (pronounced: fishing) is an attack that attempts to steal your money, or your identity, by getting you to reveal personal information -- such as credit card numbers, bank information, or passwords -- on websites that pretend to be legitimate. Cybercriminals typically pretend to be reputable companies, friends, or acquaintances in a fake message, which contains a link to a phishing website.",
  author: "Microsoft Support",
  published_at: "2023-11-14"
)

ScamArticle.create!(
  title: "Common Targets",
  body: "Religious organizations, community groups, and older adults are often targets for fraudsters.",
  author: "BC Securities Commission",
  published_at: "2023-11-14"
)

ScamArticle.create!(
  title: "Scam and Phishing Resources | Please Read!!",
  body: "Hello all,

  As technology continues to advance and expand, so do scammers, learning new methods to try to steal your money or your identity. Public Safety has created a new page that includes information on common scams to be aware of and some helpful tips to keep yourself and our community safe: https://publicsafety.columbia.edu/scams.
  
  Below are some tips from Public Safety that you can use to avoid being scammed via email:
  Never give out your personal information over the phone or email unless you are sure of the identity of the person you are talking to.
  Double-check the email address of senders to ensure it is accurate before clicking any links or replying to it!
  Be suspicious of any email or phone call that asks for your personal information or credit card number.
  Personal information includes your cellphone number, email address, banking information, credit card information, etc. 
  Do not click on links in emails or text messages from people you don't know. 
  Be careful about what information you share on social media. 
  Keep your software up to date. 
  Use strong passwords and change them regularly. 
  If you think you have been scammed, you should report it to the authorities and to the company or organization that was impersonated. You should also keep a record of all the information you have about the scam, including the phone number, email address, and website address. 
  If you are not sure if an email is a scam or real, you can take a screenshot and send it to CS Advising to verify. Never forward suspicious emails!!
  If you have any questions or concerns about phishing scams or suspicious emails, do not hesitate to reach out to CUIT, CRF, Public Safety, or CS Advising.",
  author: "Columbia CS Advising",
  published_at: "2023-11-14"
)