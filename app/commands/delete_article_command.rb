class DeleteArticleCommand < ParentCommand
  # Intializes a new instance of the class from the specified hash.
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

  # Deletes a article
  #
  def do_execute
    if @id
      Article.where(id: @id).delete_all
    else
      0
    end
  end
end