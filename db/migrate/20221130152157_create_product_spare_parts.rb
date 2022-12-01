class CreateProductSpareParts < ActiveRecord::Migration[7.0]
  def change
    create_table :product_spare_parts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
