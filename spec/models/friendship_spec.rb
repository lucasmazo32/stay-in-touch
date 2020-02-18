require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Creating friendships' do
    user1 = User.new(name: 'Foobar', email: 'foo@bar.com', password: 'foobar')
    if user1.valid?
      user1.save
      user2 = User.new(name: 'Foobar', email: 'foo1@bar.com', password: 'foobar')
      user2.save
    else
      user1 = User.first
      user2 = User.second
    end

    it 'must create a friendship between two users' do
      friendship = user1.friendships.build(friended: user2)
      expect(friendship.save).to be true
      friendship.save
      expect(friendship.status).to be false
    end
  end
end
