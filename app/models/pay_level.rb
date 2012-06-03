class PayLevel < ActiveRecord::Base
   attr_accessible :amount, :photo_url, :description, :message, :name

   composed_of :amount,
    :class_name => "Money",
    :mapping => [%w(amount_in_cents cents)],
    :constructor => Proc.new { |cents| Money.new(cents || 0, Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
end
