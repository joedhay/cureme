class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.integer :product_id
      t.integer :user_id
      t.integer :comment_to
      t.integer :comment_from
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
