class Test < ApplicationRecord
	def self.all_tests_by_category(category)
		Test.joins(:category).where(categories: { title: category }).order(title: :desc)
	end
end
