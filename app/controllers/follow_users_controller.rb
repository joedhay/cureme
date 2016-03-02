class FollowUsersController < ApplicationController
  layout 'layouts/home'

  def save_follow_users
   followed_by =  session[:user_logged_id]
   user_id = params[:user_id]
   product_id = params[:product_id]

   follow_user_exist = FollowUser.where(:user_id => user_id,:followed_by => followed_by).first

   if !follow_user_exist.present?
     follow_user = FollowUser.new
     follow_user.user_id = user_id
     follow_user.followed_by =  followed_by
     follow_user.total =  1
     follow_user.save
   end



   @product = Product.find(product_id)
   @comments = Comment.where("product_id = #{product_id} and parent_id is null")
   @child_comments = Comment.where("product_id = #{product_id} and message_to = #{session[:user_logged_id]}")
   @comment_cnt = Comment.where(:product_id => @product.id).count()

   @data = render :partial => 'comments/comment_list'
  end

end