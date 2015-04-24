Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :sep_inquiries do
    resources :sep_inquiries, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :sep_inquiries, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/sep_inquiries" do
      resources :sep_inquiries, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

