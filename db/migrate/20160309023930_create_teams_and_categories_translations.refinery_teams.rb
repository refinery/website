# This migration comes from refinery_teams (originally 3)
class CreateTeamsAndCategoriesTranslations < ActiveRecord::Migration
  def up
    Refinery::Teams::Team.create_translation_table!({
      :body => :text
    }, {
      :migrate_data => true
    })

    Refinery::Teams::Category.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Refinery::Teams::Team.drop_translation_table! :migrate_data => true
    Refinery::Teams::Category.drop_translation_table! :migrate_data => true
  end
end