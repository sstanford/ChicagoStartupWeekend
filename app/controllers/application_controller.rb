class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def set_current_user(value)
    session[:current_user_id] = value.id
  end

  def authenticate
    current_user
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end
end
