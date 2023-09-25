# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :welcome_flash_after_sign_in, only: %i[create]

  protected

  def welcome_flash_after_sign_in
    flash[:notice] =  "Привет, #{current_user.first_name}!" unless current_user.is_a?(Admin)
  end
end
