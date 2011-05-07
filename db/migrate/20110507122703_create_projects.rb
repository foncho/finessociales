class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :year_id
      t.integer :organization_id
      t.string :title
      t.float :budget

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
