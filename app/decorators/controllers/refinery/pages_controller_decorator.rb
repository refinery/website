require 'rubygems'
require 'gems'
require 'github_api'

module RefineryPagesControllerDecoratoration
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::DateHelper

  def home
    gem = Gems.info 'refinerycms'

    github = Github.new
    github_repos_infos = github.repos.get(user: 'refinery', repo: 'refinerycms')
    github_stats = github.repos.stats.contributors(user: 'refinery', repo: 'refinerycms')
    github_repos_latest_commit = github.repos.commits.list(user: 'refinery', repo: 'refinerycms').first

    @project_infos = {
      gem_downloads: number_with_delimiter(gem["downloads"], :delimiter => ','),
      gem_version: gem["version"],
      github_watchers: number_with_delimiter(github_repos_infos.watchers_count, :delimiter => ','),
      github_contributors: 378,
      latest_commit_date: distance_of_time_in_words(Time.now.utc - Time.parse(github_repos_latest_commit.commit.author.date).utc),
      latest_commit_author: github_repos_latest_commit.commit.author.name
    }

    super
  end
end

Refinery::PagesController.send :prepend, RefineryPagesControllerDecoratoration