class Transaction < ActiveRecord::Base
  attr_accessible :amount, :text, :photo, :payer_user_id, :payee_user_id, :status
composed_of :amount,
  :class_name => "Money",
  :mapping => [%w(amount_cents cents)],
  :constructor => Proc.new { |cents| Money.new(cents || 0, Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }


  def post_transaction_to_facebook
    FacebookConnection.client
    me = FbGraph::User.new(User.find(payee_user_id).facebook_id, :access_token => User.find(payer_user_id).facebook_token)
    #me = FbGraph::User.fetch(User.find(payer_user_id).facebook_token)
    #user = FbGraph::User.fetch('matake')
    me.feed!( message: text,
      picture: photo, 
      link: 'http://www.google.com',
      name: 'test',
      description: text)
    end
end

