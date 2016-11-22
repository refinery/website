class CreateGuidesGuides < ActiveRecord::Migration

  def up
    create_table :refinery_guides do |t|
      t.string :title
      t.text :description
      t.text :raw_source
      t.text :html
      t.string :author
      t.string :category
      t.string :source_url
      t.string :sha
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-guides"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/guides/guides"})
    end

    drop_table :refinery_guides

  end

end
