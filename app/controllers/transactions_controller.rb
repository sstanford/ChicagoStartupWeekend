class TransactionsController < ApplicationController
  #before_filter :authenticate

  def new
    @transaction = Transaction.new
   # @friends = current_user.facebook_friend_search('ds')
    render :layout => "application"
  end

  def show
    @transaction = Transaction.find(params[:id])
    render :layout => "application"
  end

  def create
    facebook_id = params["abc"]["xyz_id"]

    user = User.where(facebook_id: facebook_id.to_i).first
    unless user
      user = User.create!(pending: true,
                          facebook_id: facebook_id.to_i)
    end
    Transaction.create!(amount: 500,
                        description:  'This is a test please ignore',
                        message:  'This is a test please ignore',
                        photo_url: 'http://evening-rain-3606.herokuapp.com/granny.gif',
                        payer_user_id: current_user.id,
                        payee_user_id: user.id,
                        status: 'transaction_created',
                        pay_level_id: 1)
  end
end
