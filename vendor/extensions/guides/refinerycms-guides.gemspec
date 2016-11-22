# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-guides'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Guides extension for Refinery CMS'
  s.date              = '2016-10-25'
  s.summary           = 'Guides extension for Refinery CMS'
  s.authors           = 'Philip Arndt'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.4'
  s.add_dependency             'friendly_id',         ['>= 5.1.0', '< 5.3']
  s.add_dependency             'acts_as_indexed',     '~> 0.8.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.4'
end
