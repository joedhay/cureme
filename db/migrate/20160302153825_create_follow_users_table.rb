class CreateFollowUsersTable < ActiveRecord::Migration
  def change
    create_table :follow_users do |t|
      t.integer :user_id
      t.integer :followed_by
      t.integer :total

      t.timestamps null: false
    end
  end
end
