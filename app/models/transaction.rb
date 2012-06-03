class Transaction < ActiveRecord::Base
  attr_accessible :amount, :description, :message, :photo_url, :pay_level_id, :payer_user_id, :payee_user_id, :status

  composed_of :amount,
    :class_name => "Money",
    :mapping => [%w(amount_cents cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  def payee
    User.find(payee_user_id)
  end

  def payer
    User.find(payer_user_id)
  end

  def post_transaction_to_facebook
    FacebookConnection.client
    me = FbGraph::User.new(payee.facebook_id, :access_token => payer.facebook_token)
    me.feed!( message: message,
             picture: photo_url,
             link: "http://www.belated.co/transactions/#{id}",
             name: 'Belated',
             description: description)
    end
end

