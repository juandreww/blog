# frozen_string_literal: true

class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show", status: :unprocessable_entity
      # redirect_to article_path(@comment.article_id), flash: { error: @comment.errors.full_messages.join(', ') }
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
