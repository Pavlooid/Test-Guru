# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author

  validates :first_name, :last_name, :email, :username, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end
