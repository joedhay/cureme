class Api::V1:: ApiController < ApplicationController
  respond_to :html, :json, :xml
  layout false


  def get_products

    @products = Product.all

    if @products.present?
      @products
    else
      @products = []
    end

  end

end