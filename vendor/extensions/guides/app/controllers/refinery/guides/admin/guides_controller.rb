module Refinery
  module Guides
    module Admin
      class GuidesController < ::Refinery::AdminController

        crudify :'refinery/guides/guide'

        private

        # Only allow a trusted parameter "white list" through.
        def guide_params
          params.require(:guide).permit(:title, :description, :content, :author, :category, :source_url)
        end
      end
    end
  end
end
