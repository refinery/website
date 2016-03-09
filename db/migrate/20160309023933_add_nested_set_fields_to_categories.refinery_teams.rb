# This migration comes from refinery_teams (originally 6)
class AddNestedSetFieldsToCategories < ActiveRecord::Migration
  def self.up
    add_column :refinery_teams_categories, :parent_id, :integer
    add_column :refinery_teams_categories, :lft, :integer
    add_column :refinery_teams_categories, :rgt, :integer
    add_column :refinery_teams_categories, :depth, :integer

    Refinery::Teams::Category.add_translation_fields! slug: :string

    # This is necessary to update :lft and :rgt columns
    ::Refinery::Teams::Category.rebuild!
  end

  def self.down
    remove_column :refinery_teams_categories, :parent_id
    remove_column :refinery_teams_categories, :lft
    remove_column :refinery_teams_categories, :rgt
    remove_column :refinery_teams_categories, :depth

    remove_column :refinery_teams_category_translations, :slug
  end
end