Rails.application.routes.draw do
  get '/t/:major(.:minor)(.:patch)', :to => 'templates#show'

  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path
end
