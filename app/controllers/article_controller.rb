class ArticleController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add
    @article= Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    file = params[:article][:file]

    if @article.validate
      options = initialize_article(params[:article])
      Article::AddArticleCommand.new(options).execute
      save_file(file, options['image_name']) if file
      flash[:success] = 'New article is successfully created'
      redirect_to home_path
    else
      render 'add'
    end
  end

  def delete
    begin
      Article::DeleteArticleCommand.new(params).execute
      @articles = Article.all
      flash[:success] = 'Article is successfully deleted'
      respond_to do |format|
        format.html { redirect_to '/home'}
        format.json
      end
    rescue
      flash[:danger] = 'Article can not be deleted'
      raise
    end
    # end
  end

  private
  def save_file (file,file_name)
    directory = Rails.application.config.x.file.path
    name = file_name
    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(file.read) }

  end

  def initialize_article(params)
    option = {}
    option['title']= params[:title]
    option['content'] = params[:content]
    option['video'] = params[:video]
    option['user_id'] = current_user.id unless current_user.nil?
    option['image_name'] = Time.now.to_i.to_s+ '_' + params[:file].original_filename unless params[:file].nil?

    return option
  end

  def init_user (options)
    article = Article.new()
    article.title = options['title']
    article.content = options['content']
    article.video = options['video']
    article.image_name = options['image_name']
    article.user = current_user
    return article
  end

  def article_params
    params.require(:article).permit(:title, :content, :video, :image_name)
  end

end
