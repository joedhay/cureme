class AddColumnFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :logged_count, :integer
  end

end