class CreateProjectWorkloads < ActiveRecord::Migration
  def change
    create_table :project_workloads do |t|
      t.references :project
      t.integer :days_per_week
      t.integer :from_week
      t.integer :from_year

      t.timestamps
    end
    add_index :project_workloads, :project_id
  end
end
