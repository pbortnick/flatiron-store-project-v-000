class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.item.price * line_item.quantity
    end
    sum
  end

  def add_item(item_id)
    found_item = line_items.find_by(item_id: item_id)
    if found_item
      found_item.quantity += 1
      found_item
    else
      line_items.build(item_id: item_id)
    end
  end

end
