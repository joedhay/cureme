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

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

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

  def search_by_category
    @id = params[:category_id]
    @products = Product.where(:category_id => @id)
    redirect_to products_path
  end

  def search_box
    @search = params[:search]
    @category_id = params[:category_id]
    @user = params[:name]
    @desc = params[:desc]

    @user_ids = []

    @users = User.where("first_name LIKE '%#{@name}%' OR last_name LIKE '%#{@name}%'")

    if @users.present?
      @users.each do |user|
        @user_ids << user.id
      end
    end

    if !@category_id.nil?
      @products = Product.where("item_name LIKE '%#{@search}%' AND category_id = #{@category_id} AND description LIKE '%#{@desc}%'", :user_id => @user_ids)
    else
      @products = Product.where("item_name LIKE '%#{@search}%' AND description LIKE '%#{@desc}%'", :user_id => @user_ids)
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category_id, :item_name, :price, :description, :groups)
    end
end
