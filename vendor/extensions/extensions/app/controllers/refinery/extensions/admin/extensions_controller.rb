module Refinery
  module Extensions
    module Admin
      class ExtensionsController < ::Refinery::AdminController

        crudify :'refinery/extensions/extension',
                order: :position

        private

        # Only allow a trusted parameter "white list" through.
        def extension_params
          params.require(:extension).permit(:title, :source_url, :body, :type_list, :version_list, :author, :draft)
        end
      end
    end
  end
end
