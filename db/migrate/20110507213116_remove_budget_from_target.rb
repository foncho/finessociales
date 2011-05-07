class RemoveBudgetFromTarget < ActiveRecord::Migration
  def self.up
    remove_column :targets, :budget
  end

  def self.down
    add_column :targets, :budget, :float
  end
end
