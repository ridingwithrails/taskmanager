class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.column :schedule_id, :integer
      t.column :task_id, :integer
      t.column :position, :integer
    end
  end

  def self.down
    drop_table :todos
  end
end
