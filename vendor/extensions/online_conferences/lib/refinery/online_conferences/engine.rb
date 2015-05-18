module Refinery
  module OnlineConferences
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::OnlineConferences

      engine_name :refinery_online_conferences

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "online_conferences"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.online_conferences_admin_online_conferences_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/online_conferences/online_conference',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::OnlineConferences)
      end
    end
  end
end
