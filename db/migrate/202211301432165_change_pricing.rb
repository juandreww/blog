class ChangePricing < ActiveRecord::Migration[7.0]
  def up
    change_table :articles do |t|
      t.change :body, :string
    end
  end

  def down
    change_table :articles do |t|
      t.change :body, :text
    end
  end
end
