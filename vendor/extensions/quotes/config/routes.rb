Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :quotes, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :quotes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
