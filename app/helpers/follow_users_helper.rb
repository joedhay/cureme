module FollowUsersHelper

  def is_follow_user? user_id,followed_by

    follow_user = FollowUser.where(:user_id => user_id,:followed_by => followed_by).limit(1)

    if follow_user.present?
      false
    else
      true
    end

  end
end