class CreateTargetBudgets < ActiveRecord::Migration
  def self.up
    create_table :target_budgets do |t|
      t.integer :target_id
      t.float :budget
      t.integer :year_id

      t.timestamps
    end
  end

  def self.down
    drop_table :target_budgets
  end
end
