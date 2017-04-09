class AddArticleCommand < ParentCommand
  # Intializes a new instance of the class from the specified hash.
  #
  def initialize(options)
    @article = Article.new()
    @article.title = options['title']
    @article.content = options['content']
    @article.video = options['video']
    @article.image_name = options['image_name']
  end

  # Gets JSON representation of this instance.
  def to_json
    @article.as_json()
  end

  protected

  # Add a article
  #
  def do_execute
    @article.save!
  end
end