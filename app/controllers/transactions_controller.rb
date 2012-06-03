class TransactionsController < ApplicationController
  before_filter :authenticate

  def new
    @transaction = Transaction.new
    @friends = current_user.facebook_friend_search('ds')
    render :layout => "application"
  end

  def show
    #@transaction = Transaction.find(params[:id])
    render :layout => "application"
  end

  def create
    facebook_id = params['friend_id']
    user = User.where(facebook_id: facebook_id.to_i).first
    unless user
      user = User.create!(pending: true,
                          facebook_id: facebook_id.to_i,
                          first_name: 'fake_first',
                          last_name: 'fake_last')
    end
    pay_level = PayLevel.find(params['pay_level'].to_i)
    transaction = Transaction.create!(amount: pay_level.amount,
                                      description:  params['message'],
                                      message:  pay_level.message,
                                      photo_url: pay_level.photo_url,
                                      payer_user_id: current_user.id,
                                      payee_user_id: user.id,
                                      status: 'transaction_created',
                                      pay_level_id: pay_level.id)
    transaction.post_transaction_to_facebook
    redirect_to url_for(transaction)
  end
end
