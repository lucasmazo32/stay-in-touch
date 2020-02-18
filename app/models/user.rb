class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, foreign_key: 'friend', class_name: 'Friendship', dependent: :destroy
  has_many :inverse_friendships, foreign_key: 'friended', class_name: 'Friendship', dependent: :destroy

  def friends
    friends_arr = friendships.map{ |x| x.friended if x.status }
    friends_arr += inverse_friendships.map { |x| x.friend if x.status }
    friends_arr.compact
  end
end
