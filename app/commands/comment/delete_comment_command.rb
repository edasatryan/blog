class DeleteCommentCommand < ParentCommand
  # Initializes a new instance of the class from the specified hash.
  #
  def initialize(options)
    @id = options['id']
  end

  # Gets JSON representation of this instance.
  def to_json
    if @id
      { id: @id }.to_json
    end
  end

  protected

  # Deletes a comment
  def do_execute
    if @id
      # get article by id
      @comment = Comment.where(id: @id).first!

      # delete comment from database
      @comment.destroy
    else
      0
    end
  end
end