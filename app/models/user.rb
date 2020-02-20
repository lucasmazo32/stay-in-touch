class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, foreign_key: 'friend', class_name: 'Friendship', dependent: :destroy
  has_many :inverse_friendships, foreign_key: 'friended', class_name: 'Friendship', dependent: :destroy

  def friends
    friendships.where(status: true)
  end

  def sent_request(user)
    friends_ar = friendships.where(status: false).find_by(friended: user)
    friends_ar unless friends_ar.nil?
  end

  def accepted_request(user)
    friends_ar = friendships.where(status: true).find_by(friended: user)
    friends_ar unless friends_ar.nil?
  end

  def invitation_received(user)
    friends_ar = inverse_friendships.where(status: false).find_by(friend: user)
    friends_ar unless friends_ar.nil?
  end

  def delete_friendship(user)
    friendship = friendships.find_by(friended: user)
    reverse_friendship = inverse_friendships.find_by(friend: user)
    friendship.delete
    reverse_friendship.delete
  end
end
