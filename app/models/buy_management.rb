class BuyManagement < ApplicationRecord

  #validates :user
  #validates :item

  #belongs_to :user
  #belongs_to :item
  #has_one :buy_delivery


  validates :user
  validates :item

  belongs_to :user
  belongs_to :item
  has_one :buy_delivery


end
