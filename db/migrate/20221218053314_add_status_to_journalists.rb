class AddStatusToJournalists < ActiveRecord::Migration[7.0]
  def change
    add_column :journalists, :status, :integer
  end
end
