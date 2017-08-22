class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :carts

  def current_cart=(cart)
    if cart.class == Cart
      @current_cart=cart
    else
      raise ArgumentError.exception("expected Cart class")
    end
  end

  def current_cart
    @current_cart
  end

end
