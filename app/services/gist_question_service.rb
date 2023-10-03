class GistQuestionService

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

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
    content = [@question.question]
    content += @question.answers.pluck(:body) 
    content.join("\n")
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ACCESS_TOKEN, api_endpoint: ROOT_ENDPOINT)
  end
end
