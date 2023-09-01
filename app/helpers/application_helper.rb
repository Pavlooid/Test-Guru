module ApplicationHelper
  def time
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Репозитарий',
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end
end

