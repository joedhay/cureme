class CreateLikeComments < ActiveRecord::Migration
  def change
    create_table :like_comments do |t|
      t.integer :comment_id
      t.integer :likes
      t.timestamps null: false
    end
  end
end