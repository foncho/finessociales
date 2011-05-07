class AddBudgetToTarget < ActiveRecord::Migration
  def self.up
    add_column :targets, :budget, :float
  end

  def self.down
    remove_column :targets, :budget
  end
end
