class Item < ApplicationRecord
  # has_many :orders
  belongs_to :user
  has_one_attached :image

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