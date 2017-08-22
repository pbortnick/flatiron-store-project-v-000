class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart=(cart)
    User.cart_id = cart.id if cart
    @current_cart = cart
    User.save
  end

  def current_cart
    @current_cart = Cart.find_by(id: User.cart_id)
  end

end
