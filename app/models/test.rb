class Test < ApplicationRecord
	def self.all_tests_by_category(category)
		joins('INNER JOIN categories ON tests.category_id = categories.id')
			.where(categories: { title: category })
			.order(title: :desc)
	end
end
