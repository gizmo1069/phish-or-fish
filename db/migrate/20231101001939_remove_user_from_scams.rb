class RemoveUserFromScams < ActiveRecord::Migration
  def change
    remove_column :scams, :user, :string
  end
end
