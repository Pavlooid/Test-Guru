# frozen_string_literal: true

module TestPassagesHelper
  def resulting(test_passage)
    if test_passage.success?
      text = "Успех, результат прохождения - #{test_passage.percant_of_success}%"
      color = 'green'
    else
      text = "Провал, результат прохождения - #{test_passage.percant_of_success}%"
      color = 'red'
    end
    content_tag(:h2, text, style: "color: #{color}")
  end
end
