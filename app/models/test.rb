# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: "You can't create test with same name and level" }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.all_tests_by_category(title_of_category)
    joins(:category)
      .where(categories: { title: title_of_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
