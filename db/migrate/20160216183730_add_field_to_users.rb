class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :alias, :string
  end
end