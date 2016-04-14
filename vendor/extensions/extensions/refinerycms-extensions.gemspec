# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-extensions'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Extensions extension for Refinery CMS'
  s.date              = '2016-04-13'
  s.summary           = 'Extensions extension for Refinery CMS'
  s.authors           = 'Brice Sanchez'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',    '~> 3.0.2'
  s.add_dependency    'acts_as_indexed',     '~> 0.8.0'
  s.add_dependency    'acts-as-taggable-on', '~> 3.4'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.2'
end
