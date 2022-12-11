class CreateJournalistsCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps
    end

    create_table :companies_journalists, id: false do |t|
      t.belongs_to :company
      t.belongs_to :journalist

      t.timestamps
    end
  end
end
