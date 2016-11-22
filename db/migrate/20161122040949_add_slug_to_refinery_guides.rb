class AddSlugToRefineryGuides < ActiveRecord::Migration
  def change
    add_column :refinery_guides, :slug, :string
    add_index :refinery_guides, :slug, unique: true
  end
end
