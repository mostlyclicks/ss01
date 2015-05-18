Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :online_conferences do
    resources :online_conferences, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :online_conferences, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/online_conferences" do
      resources :online_conferences, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

