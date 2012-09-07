class CreateBannersBanners < ActiveRecord::Migration

  def up
    create_table :refinery_banners do |t|
      t.string :title
      t.integer :picture_id
      t.string :caption
      t.string :link_url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banners"})
    end

    drop_table :refinery_banners

  end

end
