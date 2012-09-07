Refinery::PagesController.class_eval do
  before_filter :find_banners, :only => [:home]

  def find_banners
    @banners = ::Refinery::Banners::Banner.order('position ASC').limit(4)
  end
end
