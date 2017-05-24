Rails.application.routes.draw do
  resource :auth, controller: :authentication
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :registrations
  scope '/api', format: :json do
    resources :teams
  end
  resource :team_dashboard

  root to: "landing#show"
end
