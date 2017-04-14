class AdminController < ApplicationController

  def article_list
    @articles= Article.all
  end

end
