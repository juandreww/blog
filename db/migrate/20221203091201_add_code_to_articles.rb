class AddCodeToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :code, :string
  end
end
