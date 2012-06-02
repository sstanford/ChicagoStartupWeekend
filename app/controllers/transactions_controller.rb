class TransactionsController < ActionController::Base
  def new
    @transaction = Transaction.new
    render :layout => "application"
  end
end
