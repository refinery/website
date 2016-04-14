module Refinery
  module Extensions
    module Admin
      class ExtensionsController < ::Refinery::AdminController

        crudify :'refinery/extensions/extension'

        private

        # Only allow a trusted parameter "white list" through.
        def extension_params
          params.require(:extension).permit(:title, :source_url, :body, :tag_list, :author, :draft)
        end
      end
    end
  end
end
