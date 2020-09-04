class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    inverse_friends_array = inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
    inverse_friends_array.compact
  end

  # Users who have yet to confirm friend requests
  def friend_request_sent
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_request_received
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  # Accept Friend request
  def confirm_friend(user)
    friendship = inverse_friendships.find { |friendshi| friendshi.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
