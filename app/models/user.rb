class User < ActiveRecord::Base
  attr_accessible :ending, :facebook_id, :first_name, :last_name, :email, :facebook_token, :pending

  def facebook_friend_search(starts_with)
    ::FacebookConnection.client
    user = FbGraph::User.me(facebook_token).fetch
    friend_return = []
    user.friends(starts_with: 'ad').each do |user|
      friend_return << [user.name, user.identifier] 
    end
    friend_return.sort{|x,y| x.first <=> y.first}
  end
end
