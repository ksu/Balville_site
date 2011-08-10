::Refinery::Application.routes.draw do
  resources :about_pages, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :about_pages, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
