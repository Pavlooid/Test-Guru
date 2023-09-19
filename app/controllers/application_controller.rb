# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    return if current_user
    cookies[:redirect_to_request_path] = request.path
    redirect_to login_path, alert: 'Для продолжения требуется войти в систему!'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
