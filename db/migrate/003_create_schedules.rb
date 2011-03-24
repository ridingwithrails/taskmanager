class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.column :today, :date
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :schedules
  end
end
