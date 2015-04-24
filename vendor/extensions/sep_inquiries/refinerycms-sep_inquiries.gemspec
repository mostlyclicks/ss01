# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-sep_inquiries'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Sep Inquiries forms-extension for Refinery CMS'
  s.date              = '2015-04-24'
  s.summary           = 'Sep Inquiries forms-extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.1.5'
  s.add_dependency    'refinerycms-settings', '~> 2.1.0'
end
