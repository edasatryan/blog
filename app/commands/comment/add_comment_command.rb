class AddCommentCommand < ParentCommand
  # Initializes a new instance of the class from the specified hash.
  #
  def initialize(options)
    @comment.article_id = options['article_id']
    @comment.name = options['name']
    @comment.email = options['email']
    @comment.body = options['body']
  end

  # Gets JSON representation of this instance.
  def to_json
    @comment.as_json()
  end

  protected

  # Add a article
  def do_execute
    @comment.update!
  end
end