class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category

  def self.available_items
    self.line_items.length
  end

end
