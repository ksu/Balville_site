class AddCompletedescriptionField < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :completedescription, :text
  end

  def self.down
    remove_column :vacancies, :completedescription
  end
end
