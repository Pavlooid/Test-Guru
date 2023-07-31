class Test < ApplicationRecord
	def self.all_tests_by_category(category)
		joins(:category).where(categories: { title: category }).order(title: :DESK)
	end
end
