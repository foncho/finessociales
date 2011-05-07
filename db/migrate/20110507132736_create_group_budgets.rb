class CreateGroupBudgets < ActiveRecord::Migration
  def self.up
    create_table :group_budgets do |t|
      t.integer :year_id
      t.integer :group_id
      t.float :budget
      t.float :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :group_budgets
  end
end
