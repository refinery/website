Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :extensions do
    resources :extensions, :path => '', :only => [:index]
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
