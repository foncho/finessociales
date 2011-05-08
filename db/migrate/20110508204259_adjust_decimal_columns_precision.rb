class AdjustDecimalColumnsPrecision < ActiveRecord::Migration
  def self.up
    change_column :group_budgets, :budget, :decimal, :precision => 16, :scale => 2
    change_column :group_budgets, :percentage, :decimal, :precision => 16, :scale => 2
    change_column :organization_budgets, :budget, :decimal, :precision => 16, :scale => 2
    change_column :projects, :budget, :decimal, :precision => 16, :scale => 2
    change_column :target_budgets, :budget, :decimal, :precision => 16, :scale => 2
    change_column :years, :budget, :decimal, :precision => 16, :scale => 2
    change_column :years, :social_percentage, :decimal, :precision => 16, :scale => 2
    change_column :years, :foreing_percentage, :decimal, :precision => 16, :scale => 2
    change_column :years, :environmental_percentage, :decimal, :precision => 16, :scale => 2
    change_column :organizations, :budget, :decimal, :precision => 16, :scale => 2
  end

  def self.down
    change_column :group_budgets, :budget, :decimal, :precision => 8, :scale => 2
    change_column :group_budgets, :percentage, :decimal, :precision => 8, :scale => 2
    change_column :organization_budgets, :budget, :decimal, :precision => 8, :scale => 2
    change_column :projects, :budget, :decimal, :precision => 8, :scale => 2
    change_column :target_budgets, :budget, :decimal, :precision => 8, :scale => 2
    change_column :years, :budget, :decimal, :precision => 8, :scale => 2
    change_column :years, :social_percentage, :decimal, :precision => 8, :scale => 2
    change_column :years, :foreing_percentage, :decimal, :precision => 8, :scale => 2
    change_column :years, :environmental_percentage, :decimal, :precision => 8, :scale => 2
    change_column :organizations, :budget, :decimal, :precision => 8, :scale => 2
  end
end
