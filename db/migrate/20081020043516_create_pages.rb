class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :pages, :title, :unique => true
  end

  def self.down
    remove_index :pages, :column => :title
    drop_table :pages
  end
end
