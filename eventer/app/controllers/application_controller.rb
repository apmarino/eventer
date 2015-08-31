class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:author_id]) if session[:author_id]
  end

  def authenticate
    unless current_user.present?
      redirect_to login_path
    end
  end
end
