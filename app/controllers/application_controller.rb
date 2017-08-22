class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_cart


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def initialize_cart
    @cart = current_user.current_cart
    if @cart.nil?
      @cart = Cart.create
      @cart.user = current_user
      current_user.current_cart = @cart
      current_user.save
      @cart.save
    end
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
