class Item < ActiveRecord::Base
  belongs_to :category

  def self.available_items
    all.find_all {|item| item.inventory > 0}
  end
end
