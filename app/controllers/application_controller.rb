class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Core::Exceptions::Handler

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise Core::Exceptions::Unauthorized
  end
end
