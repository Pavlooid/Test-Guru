class BadgeService

  RULES = {
    at_first_try: BadgeRules::AtFirstTry
    # all_tests_of_the_same_level: BadgeRules::AllTestsOfTheSameLevel,
    # all_tests_of_similar_category: BadgeRules::AllTestsOfSimilarCategory
  }
  def initialize(passage)
    @test_passage = passage
  end

  def give_badge
    Badge.all.each do |badge|
      klass = RULES[badge.rule.body.to_sym]
      @test_passage.user.badges << badge if klass.new(@test_passage, badge).meets_condition?
    end
  end
end
