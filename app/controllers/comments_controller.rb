class CommentsController < ApplicationController
  layout 'layouts/home'

  def index
    @products = Product.all
  end

  def comment_lists
    @product = Product.find(params[:id])
    @comments = Comment.where(:product_id => @product.id)
    @comment_cnt = Comment.where(:product_id => @product.id).count()


  end

  def save_comments
    product_id = params[:product_id]
    message = params[:comment]
    message_to = params[:message_to]
    parent_id = params[:parent_id]

    comment = Comment.new
    comment.product_id = product_id
    # if message_to.present?
    #   comment.message_to = message_to
    #   comment.message_from = session[:user_logged_id]
    # end

    if parent_id.present?

      cmt = Comment.find(parent_id)
      if cmt.parent_id.present?
        comment.parent_id = cmt.parent_id
      else
        comment.parent_id = parent_id
      end
    end
    comment.description = message
    comment.user_id = session[:user_logged_id]
    comment.save

    @product = Product.find(product_id)
    @comments = Comment.where("product_id = #{product_id} and parent_id is null")
    @child_comments = Comment.where("product_id = #{product_id} and message_to = #{session[:user_logged_id]}")
    @comment_cnt = Comment.where(:product_id => @product.id).count()


    @data = render :partial => 'comments/comment_list'
  end

end