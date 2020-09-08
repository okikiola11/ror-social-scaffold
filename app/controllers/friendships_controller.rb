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
    user = User.find(params[:id])
    current_user.confirm_friend(user)
    redirect_to users_path, notice: "You are now friend with #{user.name}"
  end

  def reject
    # friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id, confirmed: false)
    # friendship.destroy
    user = User.find(params[:id])
    current_user.reject_friend(user)
    redirect_to users_path, notice: "You rejected #{user.name}'s friend invitation."
  end

  def destroy; end
end
