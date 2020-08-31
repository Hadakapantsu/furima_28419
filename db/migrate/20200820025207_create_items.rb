class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps              
      t.integer :price,           null: false
      t.string :name,             null: false
      t.text :text,               null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :cost_burden_id,     null: false
      t.integer :shipping_place_id,  null: false
      t.integer :shipping_day_id,   null: false
      t.references :user,            null: false, foreign_key: true


    end
  end
end
