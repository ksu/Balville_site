::Refinery::Application.routes.draw do
  resources :vacancies, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :vacancies, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
