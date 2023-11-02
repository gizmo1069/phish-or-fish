class CreateScams < ActiveRecord::Migration
  def change
    create_table :scams do |t|
      t.string   :title
      t.text     :description
      t.string   :category
      t.string   :zipcode
      t.string   :url
      t.string   :user
    end
  end
end
