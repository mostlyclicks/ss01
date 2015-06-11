Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :team_members, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :team_members, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
