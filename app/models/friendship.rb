class Friendship < ApplicationRecord
  after_save :reverse_friend

  belongs_to :friend, class_name: 'User'
  belongs_to :friended, class_name: 'User'

  private

  def reverse_friend
    return unless status
    return if Friendship.where(friend: friended).find_by(friended: friend)

    new_friend = Friendship.new(friend: friended, friended: friend)
    new_friend.status = true
    new_friend.save
  end
end
