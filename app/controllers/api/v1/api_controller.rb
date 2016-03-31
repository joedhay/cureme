class Api::V1:: ApiController < ApplicationController
  respond_to :json, :xml
  layout false


  def get_products

    @products = Product.all

    if @products.present?
      render json: @products.to_json(:methods => [:item1_image_url,:item2_image_url,:item3_image_url,:item4_image_url])
    else
      @products = []
    end


  end

  def get_product

    @product = Product.find(params[:id])

    if @product.present?
      render json: @product.to_json(:methods => [:item1_image_url,:item2_image_url,:item3_image_url,:item4_image_url,:product_comment])
    else
      @products = []
    end


  end

end