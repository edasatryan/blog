class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.validate
      @article.comments.create(comment_params)
    else
      render 'article/show'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  private
  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
