require "kramdown"
require "octokit"

# LANG=en_US.UTF-8 kramdown -i GFM getting-started.md --no-hard-wrap --coderay-line-numbers table --smart-quotes apos,apos,quot,quot > getting-started.html

class GuidesWorker
  include Sidekiq::Worker

  KRAMDOWN_OPTIONS = {
    auto_ids: true,
    coderay_line_numbers: :table,
    hard_wrap: false,
    input: "GFM", # GitHub Flavoured Markdown
    smart_quotes: %w(apos apos quot quot)
  }.freeze

  REPO = "refinery/refinerycms".freeze
  SHA = "master".freeze
  PATTERN = %r{\Adoc/guides/.*/*.md\z}.freeze

  def perform(sha = SHA, repo = REPO)
    docs = github.tree(repo, sha, recursive: true).tree.select { |t| t.path =~ PATTERN }

    # No idea what to do with these yet, but here's the logic.
    docs.map do |doc|
      raw_doc_text = Base64.decode64(github.blob(repo, doc.sha).content)
      html = Kramdown::Document.new(raw_doc_text, KRAMDOWN_OPTIONS).to_html
      folder_name = doc.path.split('/')[-2]
      title = doc.path.split('/').last.split(' - ').last.split('.md').first

      [html, folder_name, title]
    end
  end

  def github
    @github ||= Octokit::Client.new(access_token: Rails.application.secrets.guides_access_token)
  end
end
