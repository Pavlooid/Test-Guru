module BadgeRules
  class AtFirstTry < RuleInitializer
    def meets_condition?
      @test_passage.success? && @test_passage.user.test_passages.where(test: @test_passage.test).count == 1
    end
  end
end
