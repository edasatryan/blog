class Api::V1::ArticleApiController < Api::V1::ApplicationApiController

  # skip_before_filter :verify_authenticity_token

  # Add article
  def add_article
    success AddArticleCommand.new(params).execute
  end

  # Delete article
  def delete_article
    success DeleteArticleCommand.new(params).execute
  end

  # Get articles list
  def articles
    success Article.all
  end
end
