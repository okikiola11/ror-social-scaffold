class FriendshipsController < ApplicationController
  def new
    @friendships = Friendship.new
  end

  def create
    user = User.find(params[:id])
    @friendship = Friendship.create(user_id: current_user.id, friend_id: user.id, confirmed: false)
    if @friendship.save
      flash[:notice] = 'Friend request sent successfully!'
    else
      flash[:alert] = 'Cannot send friend request'
    end
    redirect_to users_path
  end

  def accept
    user = User.find(params[:id])
    if current_user.confirm_friend(user)
      redirect_to users_path, notice: "You are now friend with #{user.name}"
    else
      render :user, alert: 'Something went wrong!'
    end
  end

  def reject
    user = User.find(params[:id])
    if current_user.reject_friend(user)
      redirect_to users_path, notice: "You rejected #{user.name}'s friend invitation."
    else
      render :user, alert: 'Something went wrong!'
    end
  end

  def destroy; end
end
