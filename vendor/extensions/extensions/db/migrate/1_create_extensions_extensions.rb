class CreateExtensionsExtensions < ActiveRecord::Migration

  def up
    create_table :refinery_extensions do |t|
      t.string :title
      t.text :body
      t.string :source_url
      t.string :author
      t.boolean :draft, default: true
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-extensions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/extensions/extensions"})
    end

    drop_table :refinery_extensions

  end

end
