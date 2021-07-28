class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.text       :image,                        null: false
      t.text       :item_name,                    null: false
      t.text       :item_profile,                 null: false
      t.string     :price,                        null: false
      t.references :item_category,                null: false
      t.references :item_status,                  null: false
      t.references :item_money_responsibility,    null: false
      t.references :item_outgoing_area,           null: false
      t.references :item_going_days,              null: false
      t.references :user

      t.timestamps
    end
  end
end
