class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps              
      t.string :image,            null: false
      t.integer :price,           null: false
      t.string :name,             null: false
      t.text :text,               null: false
      t.integer :category,        null: false
      t.integer :condition,       null: false
      t.integer :cost_burden,     null: false
      t.integer :shipping_place,  null: false
      t.integer :shipping_days,   null: false
      t.references :user,         null: false, foreign_key: true


    end
  end
end
