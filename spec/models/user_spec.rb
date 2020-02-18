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
    if user1.valid?
      user1.save
    else
      user1 = User.find_by(email: 'test@bar.com')
    end
    user2 = User.new(name: 'Foobar', email: 'test@bar.com', password: 'foobar')
    expect(user2.valid?).to be false
  end
end
