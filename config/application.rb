require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Ss01
  class Application < Rails::Application

    require 'rack/rewrite'

    config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
      # example rewrites
      # rewrite '/wiki/John_Trupiano', '/john'
      
      r301 '/about/', '/#home-about'
      r301 '/athletes/', '/'
      r301 '/video/', '/#home-videos'
      r301 '/blog/', '/#home-blog'
      r301 '/contact/', '/#home-contact'

      r301 '/video/plank-reach', '/#home-videos'
      r301 '/video/superman-pike', '/#home-videos'
      r301 '/video/1-arm-sb-chest-press-wrotation-pull', '/#home-videos'
      r301 '/video/low-back-lateral-stretch', '/#home-videos'
      r301 '/video/thoracic-rotational-mobility', '/#home-videos'
      r301 '/video/the-evolution-of-athletes', '/#home-videos'
      r301 '/video/sb-streamline-balance', '/#home-videos'
      r301 '/video/trx-angels', '/#home-videos'
      r301 '/video/trx-trunk-rotation', '/#home-videos'
      r301 '/video/trx-hip-lift-to-curl', '/#home-videos'
      r301 '/video/depth-jump', '/#home-videos'
      r301 '/video/dead-bug', '/#home-videos'
      r301 '/video/1-arm-pullover', '/#home-videos'
      r301 '/video/trx-gator-chop', '/#home-videos'
      r301 '/video/inside-a-champions-head', '/#home-videos'
      r301 '/video/set-your-goals-for-2014-it-begins-now', '/#home-videos'
      r301 '/video/swimmer-strength-website-opening-trailer', '/#home-videos'

      r301 '/blog/why-the-6-pack-should-not-be-your-goal',      '/blog/posts/why-the-6-pack-should-not-be-your-goal' 
      r301 '/blog/swimmers-shoulder-part-3',                    '/blog/posts/swimmer-s-shoulder-part-3'     
      r301 '/blog/swimmers-shoulder-part-2',                    '/blog/posts/swimmer-s-shoulder-part-2' 
      r301 '/blog/swimmers-shoulder-part-1',                    '/blog/posts/swimmer-s-shoulder-part-1'
      r301 '/blog/force-vs-power-for-swimmers',                 '/blog/posts/force-vs-power-for-swimmers'
      r301 '/blog/new-season-new-goals',                        '/blog/posts/new-season-new-goals'
      r301 '/blog/swim-faster',                                 '/blog/posts/swim-faster'
      r301 '/blog/test-retest',                                 '/blog/posts/test-retest'    
      r301 '/blog/the-upcoming-book',                           '/blog/posts/the-upcoming-book' 
      r301 '/blog/crossfit-for-performance',                    '/blog/posts/crossfit-for-performance'
      r301 '/blog/the-good-to-knows',                           '/blog/posts/the-good-to-knows'
      r301 '/blog/stretching-effects-on-recovery',              '/blog/posts/stretching-effects-on-recovery'
      r301 '/blog/swimming-for-optimal-results',                '/blog/posts/swimming-for-optimal-results'
      r301 '/blog/strength-training-for-swimmers',              '/blog/posts/strength-training-for-swimmers' 
      r301 '/blog/straight-arm-plank-wrow',                     '/blog/posts/straight-arm-plank-wrow'    
      r301 '/blog/kinetic-chain',                               '/blog/posts/kinetic-chain' 
      r301 '/blog/advanced-inverted-row',                       '/blog/posts/advanced-inverted-row'
      r301 '/blog/functional-training-what-is-it',              '/blog/posts/functional-training-what-is-it'
      r301 '/blog/integrated-strength-training',                '/blog/posts/integrated-strength-training' 
      r301 '/blog/start-turn-performances',                     '/blog/posts/start-turn-performances'
      r301 '/blog/functional-training',                         '/blog/posts/functional-training' 
      r301 '/blog/complex-movements',                           '/blog/posts/complex-movements' 

    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    config.assets.initialize_on_precompile = false

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end
