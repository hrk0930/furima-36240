class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|

      t.string       :post_number,                  null: false
      t.string       :city,                         null: false
      t.string       :address,                      null: false
      t.string       :building
      t.string       :telephone_number,             null: false
      t.references   :prefectures,                  null: false
      t.references   :user

      t.timestamps
    end
  end
end
