class Api::V1::CommentsApiController < Api::V1::ApplicationApiController
  # skip_before_filter :verify_authenticity_token

  # Add comment
  def add_comment
    success AddCommentCommand.new(params).execute
  end

  # Update comment
  def update_comment
    success UpdateCommentCommand.new(params).execute
  end

  # Delete comment
  def delete_comment
    success DeleteCommentCommand.new(params).execute
  end

  # Get comment list by article_id
  def comments
    success Comment.find_by_article_id(params['article_id'])
  end
end
