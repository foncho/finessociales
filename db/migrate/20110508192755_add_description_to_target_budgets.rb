class AddDescriptionToTargetBudgets < ActiveRecord::Migration
  def self.up
    add_column :target_budgets, :description, :text
  end

  def self.down
    remove_column :target_budgets, :description
  end
end
