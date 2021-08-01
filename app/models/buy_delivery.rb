class BuyDelivery < ApplicationRecord

 # validates :post_number,             presence: true
  #validates :city,                    presence: true
  #validates :address,                 presence: true
  #validates :building,                presence: true
  #validates :telephone_number,        presence: true
  #validates :outgoing_area_id,        presence: true
  #validates :buy_management,          presence: true

  #belongs_to :buy_managements


  validates :post_number,             presence: true
  validates :city,                    presence: true
  validates :address,                 presence: true
  validates :building,                presence: true
  validates :telephone_number,        presence: true
  validates :outgoing_area_id,        presence: true
  validates :buy_management,          presence: true

  belongs_to :buy_managements

end
