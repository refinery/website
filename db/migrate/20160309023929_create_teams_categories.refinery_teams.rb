# This migration comes from refinery_teams (originally 2)
class CreateTeamsCategories < ActiveRecord::Migration

  def up
    create_table :refinery_teams_categories do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :refinery_teams_categories, :id

    create_table :refinery_teams_categories_teams do |t|
      t.integer :teams_category_id
      t.integer :team_id
    end

    add_index :refinery_teams_categories_teams, [:teams_category_id, :team_id], :name => 'index_refinery_teams_categories_teams_on_tc_and_t'
  end

  def down
    drop_table :refinery_teams_categories
    drop_table :refinery_teams_categories_teams
  end

end
