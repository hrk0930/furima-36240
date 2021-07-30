class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      
      t.text        :name,                       null: false
      t.text        :profile,                    null: false
      t.integer     :price,                      null: false
      t.integer     :category_id,                null: false
      t.integer     :status_id,                  null: false
      t.integer     :money_responsibility_id,    null: false
      t.integer     :outgoing_area_id,           null: false
      t.integer     :going_days_id,              null: false
      t.references  :user,                    foreign_key:true 

      t.timestamps
    end
  end
end