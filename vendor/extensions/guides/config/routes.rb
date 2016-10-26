Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :guides do
    resources :guides, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :guides, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :guides, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
