module Refinery
  module Extensions
    class ExtensionsController < ::ApplicationController

      before_action :find_all_extensions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @extension in the line below:
        present(@page)
      end

      def show
        @extension = Extension.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @extension in the line below:
        present(@page)
      end

    protected

      def find_all_extensions
        @extensions = Extension.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/extensions").first
      end

    end
  end
end
