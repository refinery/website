require "kramdown"
require "octokit"
require "base64"

# LANG=en_US.UTF-8 kramdown -i GFM getting-started.md --no-hard-wrap --coderay-line-numbers table --smart-quotes apos,apos,quot,quot > getting-started.html

class GuidesWorker
  include Sidekiq::Worker

  KRAMDOWN_OPTIONS = {
    auto_ids: true,
    enable_coderay: true,
    coderay_line_numbers: :table,
    hard_wrap: false,
    input: "GFM", # GitHub Flavoured Markdown
    smart_quotes: %w(apos apos quot quot)
  }.freeze

  REPO = "refinery/refinerycms".freeze
  SHA = "master".freeze
  PATTERN = %r{\Adoc/guides/.*/*.md\z}.freeze

  def perform(sha = SHA, repo = REPO)
    @repo = repo
    @sha = sha

    # No idea what to do with these yet, but here's the logic.
    docs.map(&method(:build_guide))
  end

  def build_guide(doc)
    metadata, markdown = fetch_guide_markdown(doc)

    ::Refinery::Guides::Guide.where(
      title: doc.path.split('/').last.split(' - ').last.split('.md').first,
      sha: @sha
    ).first_or_create.tap do |guide|
      guide.update_attributes(
        :description => to_html(metadata["abstract"]),
        :raw_source => markdown,
        :html => to_html(markdown),
        :category => doc.path.split('/')[-2],
        :position => guide_position(doc.path.split("#{guide.category}/").last),
        :source_url => "https://github.com/#{@repo}/blob/#{@sha}/#{doc.path.to_s.gsub(' ', '%20')}",
        :sha => @sha
      )
    end
  end

  def fetch_guide_markdown(doc)
    raw = Base64.decode64(github.blob(@repo, doc.sha).content)
    if raw =~ /\A---/
      preamble = raw[/\A---.*?^---/m]
      raw   = raw[preamble.size..-1]
      metadata = YAML.load(preamble)
    end
    [metadata || {}, raw]
  end

  def to_html(raw_source)
    return nil if raw_source.blank?

    begin
      Kramdown::Document.new(raw_source, KRAMDOWN_OPTIONS).to_html
    rescue
      puts "Failed to parse:"
      puts raw_source.inspect
      return nil
    end
  end

  def guide_description(raw_source)
    begin
      raw_source.scan(/^(.*)endprologue\./m).flatten.first.to_s
                .split("\n\n")[1..-1].to_a
                .join("\n\n")
    rescue
      nil
    end
  end

  def guide_position(title)
    title.split(' - ').first.to_i
  rescue
    max_position
  end

  def max_position
    ::Refinery::Guides::Guide.maximum(:position)
  end

  def docs
    @docs ||= github.tree(@repo, @sha, recursive: true).tree.select do |t|
      t.path =~ PATTERN
    end
  end

  def github
    @github ||= Octokit::Client.new(
      access_token: Rails.application.secrets.guides_access_token
    )
  end
end
