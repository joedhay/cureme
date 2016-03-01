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
    @search = params[:search]

    if @search.nil?
      @products = Product.all.order(created_at: :desc)
    else
      @products = Product.where("item_name LIKE '%#{@search}%' OR description LIKE '%#{@search}%' OR groups LIKE '%#{@search}%'")
    end
    render 'index'
  end

  def new_advance_search
    @product = Product.new
  end

  def submit_advanced_search

    if params[:product].present?
      if params[:product][:category_id].nil?
        @products = Product.where("item_name LIKE '%#{params[:product][:item_name]}%' OR description LIKE '%#{params[:product][:description]}%' OR groups LIKE '%#{params[:product][:groups]}%'")
      else
        @products = Product.where("(item_name LIKE '%#{params[:product][:item_name]}%' OR description LIKE '%#{params[:product][:description]}%' OR groups LIKE '%#{params[:product][:groups]}%') AND category_id = '#{params[:product][:category_id]}'")
      end
    end
    render 'index'
  end


end