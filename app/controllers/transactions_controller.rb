class TransactionsController < ApplicationController
  before_filter :authenticate

  def new
    @transaction = Transaction.new
    @friends = current_user.facebook_friend_search('ds')
    render :layout => "application"
  end
end
