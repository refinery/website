module MenuHelper
   def menu(position, max_depth = 0)
    build_menu(menu_records(position), max_depth)
  end

  def cache_key_for_menu(position, page = nil)
    records = menu_records(position)
    count = records.count
    max_updated_at = (records.maximum(:updated_at) || Date.today).to_s(:number)
    common_cache_keys(page, position, max_updated_at, count)
  end

  protected

  def menu_records(position, max_depth = 0)
    query = Refinery::Page.live.includes(:translations)

    if position != "mobile_menu"
      query = eval("query.#{position}_pages")
    else
      query = query.fast_menu
    end

    if max_depth > 0
      query = query.includes(:children)
    end

    query = query.order(:lft)
    query
  end

  private

  def common_cache_keys(page, position, max_updated_at, count)
    "#{I18n.locale}/refinery/#{position}/#{page.id}-#{max_updated_at}-#{count}"
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