module BadgeRules
  class CompleteTest < RuleInitializer
    def meets_condition?
      @test_passage.success?
    end
  end
end
