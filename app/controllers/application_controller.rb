# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    current_user.is_a?(Admin) ? admin_tests_path : root_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
