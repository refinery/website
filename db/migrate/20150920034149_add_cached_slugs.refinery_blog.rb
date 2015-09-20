# This migration comes from refinery_blog (originally 20110803223526)
class AddCachedSlugs < ActiveRecord::Migration
  def change
    add_column :refinery_blog_categories, :cached_slug, :string
    add_column :refinery_blog_posts, :cached_slug, :string
  end
end
