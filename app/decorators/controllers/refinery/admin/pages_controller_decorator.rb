Refinery::Admin::PagesController.prepend(
  Module.new do
    def permitted_page_params
      super << [:show_in_main_menu, :show_in_marketing_menu, :show_in_footer_menu]
    end
  end
)