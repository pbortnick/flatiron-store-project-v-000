class CartsController < ApplicationController

  def show
    @current_cart = Cart.find_by(id: params[:id])
    if params[:commit] == "Checkout"
      @current_cart.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
      @current_cart.status = "submitted"
      @current_cart.save
      current_user.current_cart = nil
      @current_cart = current_user.carts.last
      redirect_to cart_path(@current_cart), notice: "Order placed."
    end
  end

end
