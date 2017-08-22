class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category

  def self.available_items
    self.line_items.length
  end
  belongs_to :category

  def self.available_items
    all.find_all {|item| item.inventory > 0}
  end
end
