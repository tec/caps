class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :worker
      t.integer :days_per_week
      t.integer :from_week
      t.integer :from_year

      t.timestamps
    end
    add_index :availabilities, :worker_id
  end
end
