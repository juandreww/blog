class AddCountCommentsNewToArticles < ActiveRecord::Migration[7.0]
  def up
    change_table :articles do |t|
      t.change :total_comments, :string
    end
  end

  def down
    change_table :articles do |t|
      t.change :total_comments, :integer
    end
  end
end
