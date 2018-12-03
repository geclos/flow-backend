class ApplicationController < ActionController::Base
  include Core::Exceptions::Handler

  before_action :set_raven_context

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise Core::Exceptions::Unauthorized
  end

  def current_company
    @current_company ||= current_user.company
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:user_id]) if session[:user_id]
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
