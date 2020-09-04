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

  def destroy; end

  def accept
    @friendship = Friendship.find(params[:id])
    @friendship.update(confirmed: true)
    if @friendship.save
      flash[:notice] = "You are now friends"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Something went wrong ..."
      redirect_to user_path(current_user)
    end
  end

  def reject; end
end
