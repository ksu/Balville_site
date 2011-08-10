class AddFulldescriptionField < ActiveRecord::Migration
  def self.up
    add_column :projects, :fulldescription, :text
  end

  def self.down
    remove_column :projects, :fulldescription
  end
end
