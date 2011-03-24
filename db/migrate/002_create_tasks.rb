class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.column 'name', :string
      t.column 'complete', :datetime
      t.column 'due', :date
      t.column 'created_on', :datetime
      t.column 'updated_on', :datetime
      t.column 'user_id', :integer
    end
  end

  def self.down
    drop_table :tasks
  end
end
