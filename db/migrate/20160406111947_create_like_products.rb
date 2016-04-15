class CreateLikeProducts < ActiveRecord::Migration
  def change
    create_table :like_products do |t|
      t.integer    :product_id
      t.integer    :user_id
      t.integer    :like_count
      t.timestamps
    end
  end
end