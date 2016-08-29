# This migration comes from refinery_copywriting (originally 3)
class AddPhraseType < ActiveRecord::Migration

  def self.up
    add_column :copywriting_phrases, :phrase_type, :string
  end

  def self.down
    remove_column :copywriting_phrases, :phrase_type
  end

end
