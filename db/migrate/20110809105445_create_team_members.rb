class CreateTeamMembers < ActiveRecord::Migration

  def self.up
    create_table :team_members do |t|
      t.integer :photo_id
      t.string :name
      t.text :info
      t.integer :position

      t.timestamps
    end

    add_index :team_members, :id

    load(Rails.root.join('db', 'seeds', 'team_members.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "team_members"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/team_members"})
    end

    drop_table :team_members
  end

end
