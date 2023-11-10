module BadgeRules
  class RuleInitializer
    def initialize(passage, badge)
      @test_passage = passage
      @rule = badge.rule
    end
  end
end
