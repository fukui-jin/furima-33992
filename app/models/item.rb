class Item < ApplicationRecord
  # has_many :orders
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  #カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id, :delivery_price_id, :delivery_time_id, :item_condition_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 0 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_price
  belongs_to :prefectures
  belongs_to :delivery_time

end