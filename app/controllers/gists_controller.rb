class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(
        question: @test_passage.current_question,
        url: result.url,
        email_of_author: current_user.email
      )
      redirect_to @test_passage, { notice: t('.success',
      link: view_context.link_to(t('.link'), result.url, target: "_blank")) }
    else
      redirect_to @test_passage, { alert: t('.failure') }
    end
  end
end
