class AddCustomMenusToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :show_in_footer_menu,    :boolean, default: false
    add_column :refinery_pages, :show_in_marketing_menu, :boolean, default: false
    add_column :refinery_pages, :show_in_main_menu,      :boolean, default: false
  end
end