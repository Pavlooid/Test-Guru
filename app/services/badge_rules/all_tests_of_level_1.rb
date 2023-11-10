module BadgeRules
  class AllTestsOfLevel1 < RuleInitializer
    def meets_condition?
      level_of_tests_1 = Test.where(level: 1).order(:id).pluck(:id)
      passed_tests_level_1 = TestPassage.where(user: @test_passage.user, test: level_of_tests_1)
                                        .select(&:success?).pluck(:test_id).uniq
      level_of_tests_1 == passed_tests_level_1
    end
  end
end
