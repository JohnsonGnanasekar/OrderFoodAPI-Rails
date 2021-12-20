class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  validates_uniqueness_of :email
  has_many :orders
  has_many :products, through: :orders
end