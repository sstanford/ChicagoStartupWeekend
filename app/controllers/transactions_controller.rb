class TransactionsController < ApplicationController
  before_filter :authenticate

  def new
    @transaction = Transaction.new
    render :layout => "application"
  end
end
