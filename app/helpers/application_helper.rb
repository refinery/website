module ApplicationHelper

  def main_menu
    build_menu main_menu_records, 1
  end

  def mobile_menu
    build_menu mobile_menu_records, 3
  end

  def footer_menu
    build_menu footer_menu_records
  end

  protected

  def main_menu_records
    Refinery::Page.with_translations(I18n.locale).fast_menu.sort_by(&:lft)
  end

  def mobile_menu_records
    Refinery::Page.with_translations(I18n.locale).fast_menu.sort_by(&:lft)
  end

  def footer_menu_records
    Refinery::Page.with_translations(I18n.locale).fast_menu.sort_by(&:lft)
  end

  def build_menu(pages, max_depth = 0)
    menu_items = Refinery::Menu.new pages
    presenter = Refinery::Pages::MenuPresenter.new(menu_items, self)
    presenter.dom_id = nil
    presenter.css = nil
    presenter.menu_tag = :div
    presenter.max_depth = max_depth
    presenter
  end
end