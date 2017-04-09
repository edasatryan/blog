class ArticleController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @form_name = 'article'
  end

  def create
    file = params[:article][:file]

    begin
      option = initialize_article(params[:article])
      article_id = AddArticleCommand.new(option).execute
      save_file(file,option['image_name'])
    rescue
      raise
    end

    redirect_to '/home'
  end

  private
  def save_file (file,file_name)
    directory = 'public/images/upload'
    name = file_name
    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(file.read) }
    flash[:notice] = "File uploaded"
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
