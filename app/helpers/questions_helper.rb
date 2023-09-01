module QuestionsHelper
  FOR_HEADERS = { 'new' => 'Создать новый', 'edit' => 'Изменить' }.freeze

  def question_header(action, test_title)
    header = "#{FOR_HEADERS[action]} вопрос по теме '#{test_title}'"
    content_tag(:h1, header)
  end
end
