class CreateDevicesAndAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_number
      t.belongs_to :journalist
      t.timestamps
    end

    create_table :accounts do |t|
      t.string :username
      t.belongs_to :device
      t.timestamps
    end
  end
end
