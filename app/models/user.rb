class User < ApplicationRecord
  has_many :items
  has_many :orders
  has_many :reviews
end
