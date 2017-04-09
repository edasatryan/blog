class Api::V1::ArticleController < Api::V1::ApplicationApiController

  def add_article
    success AddCityCommand.new(payload).execute
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
