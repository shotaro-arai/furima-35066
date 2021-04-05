class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,        null: false
      t.integer :prefectures_id,  null: false
      t.string :city,             null: false
      t.string :address_number,   null: false
      t.string :building
      t.string :phone_number,     null: false
      t.references :sales_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
