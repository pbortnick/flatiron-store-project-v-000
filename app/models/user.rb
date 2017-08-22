class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :carts
  has_one :current_cart, class: "Cart", foreign_id: 'user_id'

end
