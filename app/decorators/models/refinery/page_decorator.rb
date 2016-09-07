Refinery::Page.class_eval do
  def self.main_menu_pages
    where show_in_main_menu: true
  end

  def self.marketing_menu_pages
    where show_in_marketing_menu: true
  end

  def self.footer_menu_pages
    where show_in_footer_menu: true
  end
end