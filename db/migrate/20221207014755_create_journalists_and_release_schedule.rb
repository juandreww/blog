class CreateJournalistsAndReleaseSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :journalists do |t|
      t.string :name
      t.timestamps
    end

    create_table :release_schedules do |t|
      t.string :title
      t.date :date
      t.belongs_to :journalist
      t.belongs_to :article
      t.timestamps
    end
  end
end
