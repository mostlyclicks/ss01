# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-online_conferences'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Online Conferences forms-extension for Refinery CMS'
  s.date              = '2015-05-18'
  s.summary           = 'Online Conferences forms-extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.1.5'
  s.add_dependency    'refinerycms-settings', '~> 2.1.0'
end
