::Refinery::Application.routes.draw do
  resources :team_members, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :team_members, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
