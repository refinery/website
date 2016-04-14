module Refinery
  module Extensions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Extensions

      engine_name :refinery_extensions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "extensions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.extensions_admin_extensions_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Extensions)
      end
    end
  end
end
