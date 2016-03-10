class Api::V1:: ApiController < ApplicationController
  respond_to :json, :xml
  layout false


  def get_products

    @products = Product.all

    if @products.present?
      render json:  @products.to_json
    else
      @products = []
    end


  end

end