class AddUserIdToScams < ActiveRecord::Migration
  def change
    add_reference :scams, :user, index: true, foreign_key: true
  end
end
