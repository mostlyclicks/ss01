module Refinery
  module Quotes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Quotes

      engine_name :refinery_quotes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "quotes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.quotes_admin_quotes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/quotes/quote',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Quotes)
      end
    end
  end
end
