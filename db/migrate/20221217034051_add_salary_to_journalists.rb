class AddSalaryToJournalists < ActiveRecord::Migration[7.0]
  def change
    add_column :journalists, :salary, :decimal, precision: 19, scale: 4
  end
end
