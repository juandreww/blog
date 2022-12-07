class CreateJournalistsAndReleaseSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :journalists_and_release_schedules do |t|

      t.timestamps
    end
  end
end
