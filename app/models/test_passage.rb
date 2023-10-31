# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCANT_OF_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def accept!(answer_ids)
    return if time_over?
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def all_questions_count
    test.questions.size
  end

  def complete?
    return true if time_over?
    current_question.nil?
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  def percant_of_success
    (correct_questions.to_f / all_questions_count).round(2) * 100.to_i
  end

  def success?
    percant_of_success >= PERCANT_OF_SUCCESS
  end

  def percent_of_progress
    current_question_number / all_questions_count.to_f * 100
  end

  def time_to_finish
    (created_at + test.timer).iso8601
  end

  def time_over?
    created_at + test.timer < Time.now
  end

  private

  def before_validation_set_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.reject(&:empty?).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
