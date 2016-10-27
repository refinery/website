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

        render layout: @page.layout_template if @page.layout_template.present?
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

        render :index, layout: @page.layout_template if @page.layout_template.present?
      end

    protected

      def find_versions
        @ext_versions = Extension.live.tag_counts_on(:versions).order(name: :desc)
      end

      def find_types
        @ext_types = Extension.live.tag_counts_on(:types).order(:name)
      end

      def find_all_extensions
        @extensions = Extension.live.order(:position)
      end

      def find_page
        @page = ::Refinery::Page.find_by(link_url: "/extensions")
      end

    end
  end
end
