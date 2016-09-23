module ProjectHelper
  def expire_statistics_caches!
    ::Refinery::Setting.set(:last_update, {:value => Time.now, :scoping => :statistics})
    ::Refinery::Setting.set(:version, {:value => nil, :scoping => :statistics})
    ::Refinery::Setting.set(:downloads, {:value => nil, :scoping => :statistics})
    ::Refinery::Setting.set(:commit_date, {:value => nil, :scoping => :statistics})
    ::Refinery::Setting.set(:commit_name, {:value => nil, :scoping => :statistics})
    ::Refinery::Setting.set(:watchers, {:value => nil, :scoping => :statistics})
  end

  def latest_version
    if (version = ::Refinery::Setting.get(:version, :scoping => :statistics)).blank?
      begin
        version = ::Refinery::Setting.set(:version, {
                    :value => HTTParty.get("http://rubygems.org/api/v1/gems/refinerycms.json")['version'],
                    :scoping => :statistics
                 })
      rescue
        version = Refinery.version
      end
    end

    version.to_s
  end

  def rubygems_downloads
    if (downloads = ::Refinery::Setting.get(:downloads, :scoping => :statistics)).blank?
      begin
        downloads = ::Refinery::Setting.set(:downloads, {
                    :value => HTTParty.get("http://rubygems.org/api/v1/gems/refinerycms.json")['downloads'],
                    :scoping => :statistics
                 })
      rescue
        downloads = ''
      end
    end

    downloads
  end

  def latest_update
    begin
      commit_date = ::Refinery::Setting.get(:commit_date, :scoping => :statistics)
      commit_name = ::Refinery::Setting.get(:commit_name, :scoping => :statistics)

      if commit_date.blank? && commit_name.blank?
        latest_commit = HTTParty.get("https://api.github.com/repos/refinery/refinerycms/commits").parsed_response.first["commit"]["committer"]
        commit_date = ::Refinery::Setting.set(:commit_date, {
          :value => latest_commit["date"],
          :scoping => :statistics
        })
        commit_name = ::Refinery::Setting.set(:commit_name, {
          :value => latest_commit['name'],
          :scoping => :statistics
        })
      end
      [ commit_date, commit_name]
    rescue Exception
      []
    end
  end

  def github_watchers
    begin
      if (watchers = ::Refinery::Setting.get(:watchers, :scoping => :statistics)).blank?
        watchers = ::Refinery::Setting.set(:watchers, {
          :value => HTTParty.get("https://api.github.com/repos/refinery/refinerycms").parsed_response['watchers'],
          :scoping => :statistics
        })
      end

      watchers
    rescue Exception
      ""
    end
  end

end
