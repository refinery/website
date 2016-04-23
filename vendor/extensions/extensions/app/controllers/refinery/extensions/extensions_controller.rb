module Refinery
  module Extensions
    class ExtensionsController < ::ApplicationController

      before_action :find_all_extensions
      before_action :find_page
      before_action :find_versions
      before_action :find_types

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @extension in the line below:
        present(@page)
      end

      def show
        @extension = Extension.live.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @extension in the line below:
        present(@page)
      end

      def tagged
        @tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
        @tag_name = @tag.name
        @extensions = Extension.live.tagged_with(@tag_name).order(:position).page(params[:page])

        render :index
      end

    protected

      def find_versions
        @ext_versions = Extension.live.tag_counts_on(:versions)
      end

      def find_types
        @ext_types = Extension.live.tag_counts_on(:types)
      end

      def find_all_extensions
        @extensions = Extension.order(:position)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/extensions").first
      end

    end
  end
end
