# This migration comes from refinery_teams (originally 5)
class TranslateJobtitleInTeams < ActiveRecord::Migration
  def up
    Refinery::Teams::Team.add_translation_fields! job_title: :string
  end

  def down
    remove_column :refinery_team_translations, :job_title
  end
end