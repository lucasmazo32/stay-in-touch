require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'authorizations' do
    it 'should get redirected to sign_in' do
      get users_path
      expect(response).to redirect_to('/users/sign_in')
      get root_path
      expect(response).to redirect_to('/users/sign_in')
      user = User.new(name: 'Foobar', email: 'test@bar.com', password: 'foobar')
      user.save if user.valid?
      user = User.first
      get user_path(user)
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'should log in' do
      get '/users/sign_in'
      expect(response).to have_http_status(200)
      user = User.first
      sign_in user
      get root_path
      expect(response).to render_template(:index)
    end
  end

  describe 'Should have views logic' do
    it 'have users name in the users index' do
      user3 = User.new(name: 'Foobar', email: 'foo3@bar.com', password: 'foobar')
      if user3.valid?
        user4 = User.new(name: 'Foobar', email: 'foo4@bar.com', password: 'foobar')
        user5 = User.new(name: 'Foobar', email: 'foo5@bar.com', password: 'foobar')
        user3.save
        user4.save
        user5.save
      else
        user3 = User.find_by(email: 'foo3@bar.com')
        user4 = User.find_by(email: 'foo4@bar.com')
        user5 = User.find_by(email: 'foo5@bar.com')
      end
      user = User.find_by(email: 'foo@bar.com')
      sign_in user
      get users_path
      expect(response).to render_template(:index)
      expect(response.body).to include(user3.name, user4.name, user5.name)
      if !user.friendships.empty?
        if user.friendships.first.status
          expect(response.body).to include('Unfriend')
        else
          expect(response.body).to include('Cancel friend request')
        end
      else
        expect(response.body).to include('Send invitation')
      end
    end
  end
end
