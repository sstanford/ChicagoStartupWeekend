class Transaction < ActiveRecord::Base
  attr_accessible :friend_id, :friend_network, :message, :personal_message, :photo
end
