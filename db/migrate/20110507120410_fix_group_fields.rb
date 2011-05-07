class FixGroupFields < ActiveRecord::Migration
  def self.up
    remove_column :groups, :cif
  end

  def self.down
    add_column :groups, :cif, string
  end
end
