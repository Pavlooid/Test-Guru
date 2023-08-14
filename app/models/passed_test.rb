# frozen_string_literal: true

class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :passed, presence: true
end
