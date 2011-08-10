class CreateProjects < ActiveRecord::Migration

  def self.up
    create_table :projects do |t|
      t.string :title1
      t.string :title2
      t.text :body
      t.integer :illustration_id
      t.integer :position

      t.timestamps
    end

    add_index :projects, :id

    load(Rails.root.join('db', 'seeds', 'projects.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "projects"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/projects"})
    end

    drop_table :projects
  end

end
