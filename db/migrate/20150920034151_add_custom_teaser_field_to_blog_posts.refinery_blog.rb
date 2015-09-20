# This migration comes from refinery_blog (originally 20110803223528)
class AddCustomTeaserFieldToBlogPosts < ActiveRecord::Migration
  def change
    add_column :refinery_blog_posts, :custom_teaser, :text
  end
end

