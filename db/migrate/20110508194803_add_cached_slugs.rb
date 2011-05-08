class AddCachedSlugs < ActiveRecord::Migration
  def self.up
    add_column :organizations, :cached_slug, :string
    add_column :projects, :cached_slug, :string
    add_column :groups, :cached_slug, :string
    add_column :years, :cached_slug, :string
  end

  def self.down
    remove_column :organizations, :cached_slug
    remove_column :projects, :cached_slug
    remove_column :groups, :cached_slug
    remove_column :years, :cached_slug
  end
end
