class AddCountFindToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :frequency_to_be_found, :integer
  end
end
