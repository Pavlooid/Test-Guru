class User < ApplicationRecord
	def test_by_level(level) # только как выбрать именно проходит/пройденные тесты пока не придумал
		tests.where(level: level) 
	end
end
