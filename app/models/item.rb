class Item < ApplicationRecord

  with_options presence: true do

  validates :name
  validates :profile
  validates :price
  validates :category_id
  validates :status_id
  validates :money_responsibility_id
  validates :outgoing_area_id
  validates :going_days_id
  validates :user

  end

  belongs_to :user
  has_one :buy_management
  has_many_attached :image



end
