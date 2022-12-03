# frozen_string_literal: true

class AddHoursToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :start_hour, :time
    add_column :articles, :end_hour, :time
  end
end
