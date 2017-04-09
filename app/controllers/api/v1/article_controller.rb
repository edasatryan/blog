class Api::V1::ArticleController < Api::V1::ApplicationApiController

  # skip_before_filter :verify_authenticity_token

  def add_article
    success AddArticleCommand.new(params).execute
  end

  def delete_article
    success DeleteArticleCommand.new(params).execute
  end

  def articles
    success Article.all
  end
end
