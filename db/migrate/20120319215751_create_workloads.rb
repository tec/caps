class CreateWorkloads < ActiveRecord::Migration
  def change
    create_table :workloads do |t|
      t.references :project
      t.integer :days_per_week
      t.integer :from_week
      t.integer :from_year

      t.timestamps
    end
    add_index :workloads, :project_id
  end
end
