module UsersHelper
  def invite_friend(user)
    unless user == current_user
      unless current_user.friend?(user) || current_user.friend_request_sent.include?(user) || current_user.friend_request_received.include?(user)
        render 'users/partials/index_partial', user: user
      end
    end
  end

  def friendship_options_index(user)
    if current_user.friend_request_received.include?(user)
      render 'users/partials/index_options', user: user
    end
  end

  def friendship_options_show(user)
    if user == current_user
      render 'users/partials/show_partial'
    end
  end
end
