module RefineryPagesMenuPresenterDecoratoration
  def menu_item_css(menu_item, index)
    css = []

    css << "has-children" if menu_item.has_children?
    css << active_css if descendant_item_selected?(menu_item)
    css << selected_css if selected_item?(menu_item)
    css << first_css if index == 0
    css << last_css if index == menu_item.shown_siblings.length

    css.reject(&:blank?).presence
  end
end

Refinery::Pages::MenuPresenter.send :prepend, RefineryPagesMenuPresenterDecoratoration