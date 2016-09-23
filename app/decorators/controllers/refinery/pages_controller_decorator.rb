module RefineryPagesControllerDecoratoration
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::DateHelper
  include ProjectHelper

  def home
    expire_statistics_caches! if (Time.now - 10.minutes) > ::Refinery::Setting.find_or_set(:last_update, Time.now, :scoping => :statistics)

    @project_infos = {
      gem_downloads: number_with_delimiter(rubygems_downloads),
      gem_version: latest_version,
      github_watchers: number_with_delimiter(github_watchers),
      latest_commit_date: distance_of_time_in_words(Time.now.utc - Time.parse(latest_update.first).utc),
      latest_commit_author: latest_update.last
    }

    super
  end
end

Refinery::PagesController.send :prepend, RefineryPagesControllerDecoratoration