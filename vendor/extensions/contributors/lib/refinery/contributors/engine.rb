module Refinery
  module Contributors
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Contributors

      engine_name :refinery_contributors

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contributors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contributors_admin_contributors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/contributors/contributor',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Contributors)
      end
    end
  end
end
