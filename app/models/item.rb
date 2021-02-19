class Item < ApplicationRecord
  has_many :orders
  # belongs_to :user
  has_one_attached :image
end
