module Refinery
  module SepInquiries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::SepInquiries

      engine_name :refinery_sep_inquiries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "sep_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.sep_inquiries_admin_sep_inquiries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/sep_inquiries/sep_inquiry',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SepInquiries)
      end
    end
  end
end
