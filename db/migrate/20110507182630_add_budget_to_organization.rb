class AddBudgetToOrganization < ActiveRecord::Migration
  def self.up
    add_column :organizations, :budget, :float
  end

  def self.down
    remove_column :organizations, :budget
  end
end
