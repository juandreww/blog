class AddTypeToPictures < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :type, :string
  end
end
