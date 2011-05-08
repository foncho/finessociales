class AddTotalBudgetColumnToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :budget, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :organizations, :budget
  end
end
