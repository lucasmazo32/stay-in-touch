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
    friends_acr = friendships.map { |x| x.friended if x.status }
    friends_acr += inverse_friendships.map { |x| x.friend if x.status }
    friends_acr.compact
  end

  def sent_request(user)
    fri = friendships.where(status: false).find_by(friended: user)
    fri unless fri.nil?
  end

  def accepted_request(user)
    fri = friendships.where(status: true).find_by(friended: user)
    fri = inverse_friendships.where(status: true).find_by(friend: user) if fri.nil?
    fri unless fri.nil?
  end

  def invitation_received(user)
    fri = inverse_friendships.where(status: false).find_by(friend: user)
    fri unless fri.nil?
  end
end
