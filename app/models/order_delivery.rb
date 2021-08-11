class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :source_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token, :price

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :source_id, numericality: { other_than: 0, message: 'Select' }
  with_options presence: true do
    validates :source_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, source_id: source_id, city: city, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
