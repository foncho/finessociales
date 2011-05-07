class CreateOrganizationBudgets < ActiveRecord::Migration
  def self.up
    create_table :organization_budgets do |t|
      t.integer :organization_id
      t.float :budget
      t.integer :year_id

      t.timestamps
    end
  end

  def self.down
    drop_table :organization_budgets
  end
end
