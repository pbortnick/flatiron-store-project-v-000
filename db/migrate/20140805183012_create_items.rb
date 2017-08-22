class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
<<<<<<< HEAD
      t.string :title
      t.integer :inventory
      t.integer :price
      t.integer :category_id

      t.timestamps null: false
=======
      t.belongs_to :category
      t.string :title
      t.integer :price, scale: 2
      t.integer :inventory
>>>>>>> 9a1efe8a44b879e895c4fe014f1733e369cd44fd
    end
  end
end
