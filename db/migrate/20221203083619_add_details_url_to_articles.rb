class AddDetailsUrlToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :url, :string
  end
end
