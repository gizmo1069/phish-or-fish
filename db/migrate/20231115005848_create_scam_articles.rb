class CreateScamArticles < ActiveRecord::Migration
  def change
    create_table :scam_articles do |t|
      t.string :title
      t.text :body
      t.string :author
      t.datetime :published_at
      t.string :category
      t.string :urls

      t.timestamps null: false
    end
  end
end
