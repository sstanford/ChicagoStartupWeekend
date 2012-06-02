class TransactionsController < ActionController::Base
  def show_post
    @transaction = Transaction.new
    render :layout => "application"
  end
end
