class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :title
      t.belongs_to :journalist
      t.timestamps
    end
  end
end
