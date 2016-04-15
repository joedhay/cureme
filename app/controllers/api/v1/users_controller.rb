class Api::V1:: UsersController < ApplicationController
  respond_to :json, :xml
  layout false


  def authenticate
    email = params[:email]
    password = params[:password]

    user_email = User.where({:email => email,:password=> Digest::MD5.hexdigest(password)}).first
    user_number = User.where({:phone_number => email,:password=> Digest::MD5.hexdigest(password)}).first
    user_username = User.where({:username => email,:password=> Digest::MD5.hexdigest(password)}).first

    if user_email.present?
      user = user_email
    end

    if user_number.present?
      user = user_number
    end

    if user_username.present?
      user = user_username
    end


    if user.present?
      logged_user = User.find(user.id)

      if logged_user.present?
        cnt = logged_user.logged_count.to_i + 1
        logged_user.update_attributes(:logged_count => cnt.to_i)
      end
      render json: { :users => 1 }.to_json
    else
      render json: { :users => 0 }.to_json
    end
  end



end