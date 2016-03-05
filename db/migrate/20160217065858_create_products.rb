class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.integer :category_id
      t.string :item_name
      t.decimal :price
      t.string :description
      t.string :groupssearch_by_category

      t.timestamps null: false
    end
  end
end
