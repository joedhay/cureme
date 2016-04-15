class ProductsController < ApplicationController
  layout 'layouts/home'
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @categories = Category.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def detail
    @id = params[:id]
    @user_id = params[:user_id]

    @product = Product.find(@id)
    @products = Product.where(:user_id => @user_id)
    @comments = Comment.where(:product_id => @product.id)
    @comment_cnt = Comment.where(:product_id => @product.id).count()
    render 'show'
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = session[:user_logged_id]

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes_product
    product_id = params[:product_id]
    like = LikeProduct.where(:product_id => product_id,:user_id => session[:user_logged_id]).first
    if like.present?
      updated_like = like.like_count + 1
      like.update_attributes(:like_count => updated_like)
      render :json => { :state => 'valid'}
    else
      like_product = LikeProduct.new
      like_product.user_id = session[:user_logged_id]
      like_product.product_id = product_id
      like_product.like_count = 1
      if like_product.save
        render :json => { :state => 'valid'}
      else
        render :json => { :state => 'invalid'}
      end

    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category_id, :item_name, :price, :description, :groups, :item1, :item2, :item3, :item4, :location)
    end
end
