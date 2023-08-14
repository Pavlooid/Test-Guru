# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :question, presence: true
  validate :validate_max_answers, on: :create

  scope :true_answer, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:base) if question.answers.count > 4
  end
end
