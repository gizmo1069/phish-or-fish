Given /the following articles exist/ do |articles_table|
    articles_table.hashes.each do |article|
        ScamArticle.create article
    end
end


Then /I should see all articles/ do
    ScamArticle.all.each do |article|
        step %{I should see "#{article.title}"}
    end
end

When('I fill in the scam article details') do
    fill_in 'Title', with: 'Social Media Scams'
    fill_in 'Body', with: 'body of the scam article...'
end