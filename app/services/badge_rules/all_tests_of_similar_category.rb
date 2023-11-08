module BadgeRules
  class AllTestsOfSimilarCategory < RuleInitializer
    def meets_condition?
      category = @test_passage.test.category
      tests_category = category.tests.order(:id).pluck(:id)
      user_tests = TestPassage.where(user: @test_passage.user, test: category.tests)
                              .select(&:success?).pluck(:test_id).uniq
      tests_category == user_tests
    end
  end
end
