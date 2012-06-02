class Transaction < ActiveRecord::Base
composed_of :amount,
  :class_name => "Money",
  :mapping => [%w(amount_cents cents)],
  :constructor => Proc.new { |cents| Money.new(cents || 0, Money.default_currency) },
  :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }


  def post_transaction_to_facebook
    FacebookConnection.client
    me = FbGraph::User.me(ACCESS_TOKEN)
    me.feed!( message: 'Updating via FbGraph',
      picture: 'https://graph.facebook.com/matake/picture',
      link: 'https://github.com/nov/fb_graph',
      name: 'FbGraph',
      description: 'A Ruby wrapper for Facebook Graph API')
    end
end

