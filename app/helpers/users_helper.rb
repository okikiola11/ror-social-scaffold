module UsersHelper
  # rubocop:disable Metrics/LineLength
  def invite_friend(user)
    return if user == current_user

    if current_user.friend?(user) || current_user.friend_request_sent.include?(user) || current_user.friend_request_received.include?(user)
      return
    end

    render 'users/partials/index_partial', user: user
  end
  # rubocop:enable Metrics/LineLength

  def friendship_options_index(user)
    render 'users/partials/index_options', user: user if current_user.friend_request_received.include?(user)
  end

  def friendship_options_show(user)
    render 'users/partials/show_partial' if user == current_user
  end
end
