module FriendshipsHelper
  def send_invite(user)
    return unless current_user != user

    if current_user.sent_request(user)
      link_to 'Cancel friend request', user_path(user, params: { friendship: 'cancel_request', user_id: user.id }),
              method: :post, class: 'btn btn-secundary'
    elsif current_user.accepted_request(user)
      link_to 'Unfriend', user_path(user, params: { friendship: 'unfriend', user_id: user.id }),
              method: :post, class: 'btn btn-secundary'
    elsif current_user.invitation_received(user)
      link_to 'Delete', user_path(user, params: { friendship: 'cancel', user_id: user.id }), method: :post,
                                                                                             class: 'btn btn-secundary'
    else
      link_to 'Send invitation', user_path(user, params: { friendship: 'send', user_id: user.id }),
              method: :post, class: 'btn btn-secundary'
    end
  end

  def create_logic(parameters, user)
    case parameters
    when 'cancel_request'
      current_user.friendships.find_by(friended: user).delete
      flash[:notice] = 'Friend request canceled'
    when 'unfriend'
      current_user.delete_friendship(user)
      flash[:notice] = "#{user.name} is not longer your friend"
    when 'accept'
      a_friend = current_user.inverse_friendships.find_by(friend: user)
      a_friend.status = true
      a_friend.save
      flash[:notice] = "#{user.name} is now your friend"
    when 'send'
      n_friend = current_user.friendships.new(friended: user)
      n_friend.save
      flash[:notice] = 'Friend invitation sent'
    when 'cancel'
      current_user.inverse_friendships.find_by(friend: user).delete
      flash[:notice] = 'Friendship removed'
    end
  end
end
