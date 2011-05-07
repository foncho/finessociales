class RemoveBudgetFromOrganization < ActiveRecord::Migration
  def self.up
    remove_column :organizations, :budget
  end

  def self.down
    add_column :organizations, :budget, :float
  end
end
