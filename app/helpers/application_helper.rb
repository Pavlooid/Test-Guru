# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Репозитарий',
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end
end
