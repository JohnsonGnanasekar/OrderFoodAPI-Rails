class Product < ApplicationRecord
  has_many :order_products
  validates_uniqueness_of :name
end
