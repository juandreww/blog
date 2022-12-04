class AddCountryToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :country, :string
    add_column :comments, :gender, :integer
  end
end
