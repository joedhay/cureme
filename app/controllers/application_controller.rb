class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_categories
  before_filter :get_user_image,  :except => [:login,:register]

  def get_categories
      @categories = Category.all
  end

  def get_user_image
    if session[:user_logged_id].present?
      @user = User.find(session[:user_logged_id])
    end
  end
end
