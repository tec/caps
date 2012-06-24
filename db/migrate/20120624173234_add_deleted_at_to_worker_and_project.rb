class AddDeletedAtToWorkerAndProject < ActiveRecord::Migration
  def change
    add_column :workers, :deleted_from_year, :integer, :null => true, :default => nil
    add_column :workers, :deleted_from_week, :integer, :null => true, :default => nil
    add_column :projects, :deleted_from_year, :integer, :null => true, :default => nil
    add_column :projects, :deleted_from_week, :integer, :null => true, :default => nil
  end
end
