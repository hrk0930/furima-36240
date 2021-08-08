class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :city, :address, :building, :telephone_number, :outgoing_area_id, :token
  

  with_options presence: true do
  validates :post_number,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city
  validates :address
  validates :token
  validates :telephone_number,    format: {with: /\A\d{10,11}\z/},   numericality: { only_integer: true, message: "Input only number"}
  validates :outgoing_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :user_id
  validates :item_id
  end



  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, city: city, address: address, building: building, telephone_number: telephone_number, outgoing_area_id: outgoing_area_id,
      order_id: order.id)
  end
end