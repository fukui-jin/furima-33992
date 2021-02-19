class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title 
      t.text :description
      t.integer :category_id
      t.integer :item_condition_id
      t.integer :delivery_price_id
      t.integer :prefectures_id
      t.integer :delivery_time_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
