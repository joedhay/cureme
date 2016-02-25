class HomesController < ApplicationController
  layout 'layouts/home'
  def index
    @products = Product.all
  end


end