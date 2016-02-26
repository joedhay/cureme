class CategoriesController < ApplicationController
  layout 'layouts/home'

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_premitted_params)
    @category.user_id = session[:user_logged_id]

    if @category.save
      flash[:notice] = "New Category successfully created."
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes!(categories_premitted_params)
      flash[:notice] = "Successfully updated Category."
      redirect_to categories_path
    else
      render :edit
    end
  end

  def delete_category
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category  successfully deleted."
      redirect_to categories_path
    end
  end

  def delete_all_category
    ids = params[:ids]

    if ids.size > 0
      ids.each do |id|
        Category.find(id.to_i).destroy
      end
    end
    flash[:notice] = "Category  successfully deleted."
    if session[:role] == 'Admin'
      @categories = Category.where(:user_id => session[:user_logged_id])
    else
      @categories = Category.all
    end
    @data = render :partial => 'categories/category_lists'
  end


  def categories_premitted_params
    params.require(:category).permit(:id,:name,:description)
  end

end
