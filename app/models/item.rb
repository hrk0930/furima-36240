class Item < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :money_responsibility
  belongs_to :outgoing_area
  belongs_to :going_days



  with_options presence: true do

  validates :name
  validates :profile
  validates :price
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :money_responsibility_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :outgoing_area_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :going_days_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :user

  end

  belongs_to :user
  has_one :buy_management
  has_many_attached :image


end
