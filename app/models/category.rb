class Category < ActiveRecord::Base
  has_many :products
  has_many :users

  validates :name, presence: true
  validates :description, presence: true
end