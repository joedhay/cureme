class HomesController < ApplicationController
  layout 'layouts/home'
  def index
    @products = Product.all
    @categories = Category.all

    @product = Product.new
  end

  def search_by_category
    @product = Product.new
    @id = params[:category_id]
    @products = Product.where(:category_id => @id)
    render 'index'
  end

  def search_box
    @product = params[:product]

    if !@category_id.nil?
      @products = Product.where("item_name LIKE '%#{@search}%' AND category_id = #{@category_id} AND description LIKE '%#{@desc}%'", :user_id => @user_ids)
    else
      @products = Product.where("item_name LIKE '%#{@search}%' AND description LIKE '%#{@desc}%'", :user_id => @user_ids)
    end
    render 'index'
  end


end