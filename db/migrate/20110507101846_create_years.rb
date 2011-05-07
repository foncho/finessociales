class CreateYears < ActiveRecord::Migration
  def self.up
    create_table :years do |t|
      t.integer :year
      t.float :budget
      t.float :social_percentage
      t.float :foreing_percentage
      t.float :environmental_percentage
      t.integer :total_projects
      t.integer :total_organizations

      t.timestamps
    end
  end

  def self.down
    drop_table :years
  end
end
