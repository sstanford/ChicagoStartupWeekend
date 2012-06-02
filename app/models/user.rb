class User < ActiveRecord::Base
  attr_accessible :ending, :facebook_id, :name, :email, :facebook_token, :pending
end
