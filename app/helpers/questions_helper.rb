# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    header = if question.new_record?
               "Создать новый вопрос по теме #{@test.title} "
             else
               "Изменить вопрос по теме #{question.test.title}"
             end

    content_tag(:h1, header)
  end
end
