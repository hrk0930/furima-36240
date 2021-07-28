class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,               null: false
      t.string :encrypted_password, null: false
      t.string :email,              null: false
      t.text   :profile,            null: false
      t.references :date_of_birth,  null: false

      t.timestamps
    end
  end
end
