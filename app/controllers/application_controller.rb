class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_categories
  before_filter :get_categories,  :except => [:login]

  def get_categories
      @categories = Category.all
      session[:categories] = @categories
  end

  def set_categories
    session[:categories] = nil
  end
end
