module BadgeRules
  class ShortTests < RuleInitializer
    def meets_condition?
      short_tests = Test.where(timer: 120).order(:id).pluck(:id)
      passed_short_tests = TestPassage.where(user: @test_passage.user, test: short_tests)
                                            .select(&:success?).pluck(:test_id).uniq
      short_tests == passed_short_tests
    end
  end
end
