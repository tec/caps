class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :worker
      t.references :project
      t.integer :from_week
      t.integer :from_year
      t.integer :days_per_week

      t.timestamps
    end
    add_index :assignments, :worker_id
    add_index :assignments, :project_id
  end
end
