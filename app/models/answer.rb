# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:base) if question.answers.count > 3
  end
end
