class AddTargetIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :target_id, :integer
  end

  def self.down
    remove_column :projects, :target_id
  end
end
