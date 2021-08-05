class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :city, :address, :building, :telephone_number, :outgoing_area_id

  with_options presence: true do
  validates :post_number
  validates :city
  validates :address
  validates :telephone_number
  validates :outgoing_area_id
  validates :user_id
  validates :item_id
  end



  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, city: city, address: address, building: building, telephone_number: telephone_number, outgoing_area_id: outgoing_area_id,
      order_id: order.id)
  end
end