class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string     :message
      t.integer    :from_id
      t.integer    :to_id
      t.integer    :product_id
      t.integer    :group_id
      t.timestamps
    end
  end
end