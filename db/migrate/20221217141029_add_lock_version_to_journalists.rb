class AddLockVersionToJournalists < ActiveRecord::Migration[7.0]
  def change
    add_column :journalists, :lock_version, :integer
  end
end
