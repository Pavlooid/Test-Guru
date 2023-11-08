class BadgeService

  RULES = {
    at_first_try: BadgeRules::AtFirstTry,
    all_tests_of_level_1: BadgeRules::AllTestsOfLevel1,
    all_tests_of_similar_category: BadgeRules::AllTestsOfSimilarCategory,
    complete_test: BadgeRules::CompleteTest,
    short_tests: BadgeRules::ShortTests
  }

  def initialize(passage)
    @test_passage = passage
  end

  def give_badge
    Badge.all.each do |badge|
      new_badge = RULES[badge.rule.body.to_sym]
      @test_passage.user.badges << badge if new_badge.new(@test_passage, badge).meets_condition?
    end
  end
end
