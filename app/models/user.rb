# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author

  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'Некорректный формат почты' }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def test_by_level(level)
    tests.where(level: level)
  end
end
