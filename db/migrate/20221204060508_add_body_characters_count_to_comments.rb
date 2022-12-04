class AddBodyCharactersCountToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :body_characters_count, :integer
  end
end
