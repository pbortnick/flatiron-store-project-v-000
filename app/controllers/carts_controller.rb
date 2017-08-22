class CartsController < ApplicationController

  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @cart = Cart.find(params[:id])
    @current_cart = current_user.current_cart
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @cart.status = "submitted"
    @current_cart.save
    redirect_to cart_path(@cart), notice: "Order placed."
  end

end
