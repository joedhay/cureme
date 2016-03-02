class LikeCommentsController < ApplicationController
  layout 'layouts/home'

  def save_like_comments
    comment_id = params[:comment_id]
    product_id = params[:product_id]

    like_comment = LikeComment.where(:comment_id => comment_id).first

    if like_comment.present?
      puts "like_comment.likes:#{like_comment.likes}"
      likes = like_comment.likes + 1
      like_comment.update_attributes(:likes => likes )
    else
      like = LikeComment.new
      like.comment_id = comment_id
      like.likes = 1
      like.save
    end

    @product = Product.find(product_id)
    @comments = Comment.where("product_id = #{product_id} and parent_id is null")
    @child_comments = Comment.where("product_id = #{product_id} and message_to = #{session[:user_logged_id]}")
    @comment_cnt = Comment.where(:product_id => @product.id).count()

    @data = render :partial => 'comments/comment_list'

  end

end