# frozen_string_literal: true

class AddArticleReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :articles, index: true, foreign_key: true
    add_reference :comments, :article, index: true, foreign_key: true
  end
end
