module Refinery
  module Banners
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Banners

      engine_name :refinery_banners

      initializer "register refinerycms_banners plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "banners"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.banners_admin_banners_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/banners/banner'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Banners)
      end
    end
  end
end
