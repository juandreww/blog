class CreateBankAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.integer :account_number

      t.timestamps
    end
  end
end
