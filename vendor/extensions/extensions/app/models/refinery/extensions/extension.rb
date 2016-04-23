module Refinery
  module Extensions
    class Extension < Refinery::Core::BaseModel
      self.table_name = 'refinery_extensions'

      acts_as_taggable_on :versions, :types

      validates :title, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      def live?
        !draft
      end

      class << self
        def live
          where(draft: false)
        end
      end
    end
  end
end
