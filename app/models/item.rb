class Item < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :money_responsibility
  belongs_to :outgoing_area
  belongs_to :going_days



  with_options presence: true do
    validates :name,            length: {maximum: 40}
    validates :profile,         length: {maximum: 1000}
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to:9_999_999 },
                      presence: { message: "can't be blank"}, format: {with: /\A[0-9]+\z/}
    validates :outgoing_area_id, numericality: { other_than: 0 , message: "can't be blank"}

   with_options numericality: { other_than: 1 , message: "can't be blank"} do
     validates :category_id
     validates :status_id
     validates :money_responsibility_id
     validates :going_days_id
   end

  end

  belongs_to :user
  has_one :buy_management
  has_one_attached :image


end
