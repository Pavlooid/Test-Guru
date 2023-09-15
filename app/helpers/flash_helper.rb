# frozen_string_literal: true

module FlashHelper
  def flash_message(_alert)
    content_tag(:p, flash[:alert], class: 'flash alert') if flash.present?
  end
end
