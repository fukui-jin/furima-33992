class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :token, :price

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :token
  end
  validate :building_name
  validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    buyer = Buyer.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end