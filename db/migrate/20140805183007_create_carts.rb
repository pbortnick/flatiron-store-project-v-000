class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id

      t.timestamps null: false
      t.belongs_to :user
      t.string :status, default: "unsubmitted"
    end
  end
end
