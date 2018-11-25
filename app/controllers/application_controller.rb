class ApplicationController < ActionController::Base
  include Core::Exceptions::Handler

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise Core::Exceptions::Unauthorized
  end

  def current_company
    @current_company ||= current_user.company
  end
end
