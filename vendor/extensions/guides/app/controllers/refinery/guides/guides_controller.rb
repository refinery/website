module Refinery
  module Guides
    class GuidesController < ::ApplicationController

      before_action :find_all_guides
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guide in the line below:
        present(@page)
      end

      def show
        @guide = Guide.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guide in the line below:
        present(@page)
      end

    protected

      def find_all_guides
        @guides = Guide.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/guides").first
      end

    end
  end
end
