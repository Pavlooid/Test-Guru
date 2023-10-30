class GistQuestionService

  GUTHUB_ACCESS_TOKEN = ENV['GUTHUB_ACCESS_TOKEN']

  def initialize(question, client: setup_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params).yield_self { |responce| url responce }
  end

  private

  def url(responce)
    OpenStruct.new(
      success?: @client.last_response.status == 201,
      url: responce[:html_url])
  end

  def gist_params
    {
      description: @test.title,
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.question, *@question.answers.pluck(:body)].join("\n")
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end
end
