class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :gender
      t.string :password
      t.string :confirmed_password
      t.string :date_of_birth
      t.string :status

      t.timestamps null: false
    end
  end
end
