class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string :title
      t.integer :inventory
      t.integer :price
      t.integer :category_id

      t.timestamps null: false
      t.belongs_to :category
      t.string :title
      t.integer :price, scale: 2
      t.integer :inventory
    end
  end
end
