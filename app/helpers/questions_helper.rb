# frozen_string_literal: true

module QuestionsHelper
  FOR_HEADERS = { 'new' => 'Создать новый', 'edit' => 'Изменить' }.freeze

  def question_header(action, test_title)
    header = "#{FOR_HEADERS[action]} вопрос по теме '#{test_title}'"
    content_tag(:h1, header)
  end

  def question_headers(question)
    header = if question.new_record?
               "Создать новый вопрос по теме #{@test.title} "
             else
               "Изменить вопрос по теме #{question.test.title}"
             end

    content_tag(:h1, header)
  end
end
