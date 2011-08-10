class CreateVacancies < ActiveRecord::Migration

  def self.up
    create_table :vacancies do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :vacancies, :id

    load(Rails.root.join('db', 'seeds', 'vacancies.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "vacancies"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/vacancies"})
    end

    drop_table :vacancies
  end

end
