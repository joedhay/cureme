module UsersHelper

  def return_name id
    user = User.find(id)

    if user.present?
      "#{user.first_name} #{user.last_name}"
    else
      nil
    end
  end

  def return_month date
    date[5,2]
  end

  def return_year date
    date[0,4]
  end

  def return_day date
    date[8,9]
  end

  def return_user_image id

    user = User.find(id)

    if user.present?
      user.avatar.url(:thumb)
    else
      puts "TEST"
      "/assets/missing.jpg"
    end

  end

  def check_if_user_location_exists user_id
    user = User.find(user_id)

    if user.present?
      if user.primary_area.present?
        true
      else
        false
      end
    end
  end
end
