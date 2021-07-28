class CreateBuyDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_deliveries do |t|

      t.string       :post_number,                  null: false
      t.string       :city,                         null: false
      t.string       :address,                      null: false
      t.string       :building
      t.integer      :telephone_number,             null: false
      t.integer      :outgoing_area_id,             null: false

      t.timestamps
    end
  end
end
