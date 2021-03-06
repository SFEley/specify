class AddNestedSetFieldsToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :lft, :integer
    add_column :pages, :rgt, :integer
    add_column :pages, :parent_id, :integer
  end

  def self.down
    remove_column :pages, :parent_id
    remove_column :pages, :rgt
    remove_column :pages, :lft
  end
end
