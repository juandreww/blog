class AddManagerToJournalist < ActiveRecord::Migration[7.0]
  def change
    add_reference :journalists, :manager, null: true, foreign_key: { to_table: :journalists }
  end
end
