class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  private

  def initialize_cart
    if current_cart.nil?
      current_user.current_cart = current_user.carts.create
    end
  end

  def current_cart
    current_user.current_cart
  end

end
