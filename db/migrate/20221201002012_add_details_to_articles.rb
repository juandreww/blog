# frozen_string_literal: true

class AddDetailsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :eula, :boolean
  end
end
