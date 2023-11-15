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