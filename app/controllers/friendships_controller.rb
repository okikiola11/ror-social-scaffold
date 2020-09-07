class FriendshipsController < ApplicationController

  def new
    @friendships = Friendship.new
  end

  def create
    user = User.find(params[:id])
    @friendship = Friendship.create(user_id: current_user.id, friend_id: user.id, confirmed: false)
    if @friendship.save
      flash[:notice] = "Friend request sent successfully!"
      redirect_to users_path
    else
      flash[:alert] = "Cannot send friend request"
      redirect_to users_path
    end
  end

  def accept
    current_user.confirm_friend(User.find(params[:id]))
    redirect_to users_path
  end

  def reject; end

  def destroy; end
end
