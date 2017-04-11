class ArticleController < ApplicationController
  skip_before_action :verify_authenticity_token

  #
  def show
    @form_name = 'article'
  end

  def create
    file = params[:article][:file]

    begin
      option = initialize_article(params[:article])
      AddArticleCommand.new(option,current_user).execute
      save_file(file,option['image_name'])
      flash[:success] = 'New article is successfully created'
      redirect_to '/home'
    rescue
      flash[:danger] = 'An error exists during processing'
      redirect_to '/article'

    end

  end

  def delete
    begin
      DeleteArticleCommand.new(params).execute
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
    option['image_name'] = Time.now.to_i.to_s+ '_' + params[:file].original_filename

    return option
  end



end
