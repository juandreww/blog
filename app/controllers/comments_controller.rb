class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@article)
    else
      respond_to do |f|
        f.html { redirect_to article_path(@article) }
        f.js
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status, :email, :email_confirmation)
  end
end
