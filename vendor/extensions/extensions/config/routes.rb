Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :extensions do
    resources :extensions, :path => '', :only => [:index]

    get 'version/:tag_id(/:tag_name)' => 'extensions#tagged', :as => 'version_extensions'
    get 'type/:tag_id(/:tag_name)' => 'extensions#tagged', :as => 'type_extensions'
  end

  # Admin routes
  namespace :extensions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :extensions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
