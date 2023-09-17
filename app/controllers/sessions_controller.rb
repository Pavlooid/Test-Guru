# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:redirect_to_request_path] || root_path, method: :delete
    else
      flash.now[:alert] = 'Логин и/или пароль неверен!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  def new; end
end
