module Refinery
  module Guides
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Guides

      engine_name :refinery_guides

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "guides"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.guides_admin_guides_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Guides)
      end
    end
  end
end
