class UsersController < ApplicationController
  before_filter :authenticate

  def show
    current_user
  end
end
