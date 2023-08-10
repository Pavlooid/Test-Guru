# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  def self.all_tests_by_category(title_of_category)
    joins(:category)
      .where(categories: { title: title_of_category })
      .order(title: :desc)
  end
end
