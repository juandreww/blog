class AddDrinks < ActiveRecord::Migration[7.0]
  def change
    add_column :drinks, :brand, :string
    add_column :drinks, :name, :string
    add_column :drinks, :unit, :string
    add_column :drinks, :packaging, :integer
  end
end
