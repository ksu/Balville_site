class CreateAboutPages < ActiveRecord::Migration

  def self.up
    create_table :about_pages do |t|
      t.string :title
      t.text :body
      t.integer :illustration_id
      t.integer :position

      t.timestamps
    end

    add_index :about_pages, :id

    load(Rails.root.join('db', 'seeds', 'about_pages.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "about_pages"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/about_pages"})
    end

    drop_table :about_pages
  end

end
