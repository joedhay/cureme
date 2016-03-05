class MessagesController < ApplicationController
  layout 'layouts/home'

  def index
    @products = Product.all
  end

  def sent_messages
    @messages = @messages = Message.where("product_id = #{params[:id]} and (from_id=#{session[:user_logged_id]} or to_id=#{session[:user_logged_id]})")
    @product = Product.find(params[:id])
    comments = Comment.where(:product_id => params[:id])
    @users = []
    if comments.present?
      comments.each do |c|
        if session[:user_logged_id] != c.user_id
          @users << c.user_id
        end
      end
    end

    puts "@users:#{@users.uniq}"
  end
end