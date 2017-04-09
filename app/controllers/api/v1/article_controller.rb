class Api::V1::ArticleController < Api::V1::ApplicationApiController

  # skip_before_filter :verify_authenticity_token

  def add_article

    @article = Article.new()
    @article.title = @payload['title']
    @article.content = @payload['content']
    @article.video = @payload['video']
    success @article.save!
  end

  def delete_article
    success DeleteCityCommand.new(params).execute
  end

  def edit_article
    success DeleteCityCommand.new(params).execute
  end

  def get_article
    success DeleteCityCommand.new(params).execute
  end
end
