# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    header = if question.new_record?
               t('admin.questions.form.new_question', title: @test.title)
             else
               t('admin.questions.form.edit_question', title: question.test.title)
             end

    content_tag(:h1, header)
  end
end
