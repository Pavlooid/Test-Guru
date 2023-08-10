class Test < ApplicationRecord
	has_many :questions
	has_many :passed_tests
	has_many :users, through :passed_tests
	belongs_to :category

	def self.all_tests_by_category(category)
		joins('INNER JOIN categories ON tests.category_id = categories.id')
			.where(categories: { title: category })
			.order(title: :desc)
	end
end
