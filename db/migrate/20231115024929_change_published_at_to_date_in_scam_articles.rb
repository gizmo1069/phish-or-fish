class ChangePublishedAtToDateInScamArticles < ActiveRecord::Migration
  def change
    change_column :scam_articles, :published_at, :date
  end
end
