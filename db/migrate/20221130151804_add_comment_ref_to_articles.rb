class AddCommentRefToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :comment, null: false, foreign_key: true
  end
end
