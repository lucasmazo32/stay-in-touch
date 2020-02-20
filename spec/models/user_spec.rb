require 'rails_helper'

RSpec.describe User, type: :model do
  it 'must have a name, email and password' do
    user = User.new
    expect(user.save).to be false
    user.name = 'Foo bar'
    expect(user.save).to be false
    user.email = 'test@foo.bar'
    expect(user.save).to be false
    user.password = 'foobar'
    expect(user.valid?).to be true
  end

  it 'must have a unique email' do
    user1 = User.new(name: 'Foobar', email: 'test@bar.com', password: 'foobar')
    user1.save if user1.valid?
    user2 = User.new(name: 'Foobar', email: 'test@bar.com', password: 'foobar')
    expect(user2.valid?).to be false
  end

  it 'must have functions that behave correctly' do
    user = User.first
    expect(user.friends.nil?).to be false
    user2 = User.new(name: 'Foobar 2', email: 'test2@bar.com', password: 'foobar')
    if user2.valid?
      user2.save
    else
      user2 = User.second
    end
    fri = user.friendships.find_by(friended: user2)
    if fri.nil?
      fri = user.friendships.new(friended: user2)
      fri.save
    end
    expect(user.sent_request(user2)).to_not be nil
    expect(user2.invitation_received(user)).to_not be nil
    fri.status = true
    fri.save
    expect(user2.accepted_request(user)).to_not be nil
    expect(user.accepted_request(user2)).to_not be nil
    fri.status = false
    fri.save
  end
end
