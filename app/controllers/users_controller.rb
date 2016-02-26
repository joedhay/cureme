class UsersController < ApplicationController
  layout 'layouts/login_layout', :only => [:login,:authenticate,:show,:reset_password,:forgot_password,:register]
  def login

  end

  def logout
    session[:username] = nil
    session[:email] = nil
    session[:user_logged_id] = nil
    session[:time_logged] = nil
    session[:role] = nil
    redirect_to login_users_path
  end

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
      session[:username] = user.username
      session[:email] = user.email
      session[:user_logged_id] = user.id
      session[:time_logged] = Time.now + 1.week
      session[:role] = user.role.name
      flash[:notice] = "Welcome User"
      puts session[:role]
      logged_user = User.find(user.id)

      if logged_user.present?
        cnt = logged_user.logged_count.to_i + 1
        logged_user.update_attributes(:logged_count => cnt.to_i)
      end
      redirect_to products_path
    else
        flash[:error] = "Invalid Credentials, Please try again."
        session[:title] = nil
        session[:desc] = nil
        session[:home_index] = nil
        redirect_to login_users_path

    end
  end

  def register
    @user = User.new
    @user.build_role

    @months = { 'January' => '01', 'February' => '02','March' => '03', 'April'=> '04','May' => '05','June' => '06',
                'July' => '07', 'August' => '08', 'September' => '09','October' =>'10', 'November' => '11','December'=> '12' }
  end

  def create_user
    @months = { 'January' => '01', 'February' => '02','March' => '03', 'April'=> '04','May' => '05','June' => '06',
                'July' => '07', 'August' => '08', 'September' => '09','October' =>'10', 'November' => '11','December'=> '12' }
    day = params[:day]
    year = params[:year]
    month = params[:user][:date_of_birth]
    @user = User.new(user_premitted_params)

    @user.date_of_birth = "#{year}-#{month}-#{day}"
    @user.password = User.rehash_password(params[:user][:password])
    @user.confirmed_password = User.rehash_password(params[:user][:confirmed_password])

    if @user.save
      role = @user.build_role
      role.name = params[:user][:role][:name]
      role.user_id = @user.id
      role.save
      flash[:notice] = "New user successfully created."
      redirect_to login_users_path
    else
      render :register
    end
  end

  def profile
    @user = User.find(params[:id])
    @months = { 'January' => '01', 'February' => '02','March' => '03', 'April'=> '04','May' => '05','June' => '06',
                'July' => '07', 'August' => '08', 'September' => '09','October' =>'10', 'November' => '11','December'=> '12' }

  end

  def update
    @user = User.find(params[:id])
    day = params[:day]
    year = params[:year]
    month = params[:user][:date_of_birth]
    @months = { 'January' => '01', 'February' => '02','March' => '03', 'April'=> '04','May' => '05','June' => '06',
                'July' => '07', 'August' => '08', 'September' => '09','October' =>'10', 'November' => '11','December'=> '12' }
    if params[:user][:password].present? && params[:user][:confirmed_password].present?
      @password = User.rehash_password(params[:user][:password])
      @confirmed_password = User.rehash_password(params[:user][:confirmed_password])
    end

    if @user.update_attributes!(user_premitted_params)
      role = Role.where(:user_id => @user.id).first
      role.update_attributes(:name => params[:user][:role][:name])

      flash[:notice] = "Successfully updated user."
      session[:role] = params[:user][:role][:name]
      redirect_to products_path
    else
      render :profile
    end
  end


  private

  def user_premitted_params
    params.require(:user).permit(:id,:first_name,:last_name,:email,:password,:confirmed_password,:gender,:address,:gender,
                                 :date_of_birth,:phone_number,:alias,:username,:avatar,:logged_id_count,
                                 :role_attributes => [:id,:name])
  end


end