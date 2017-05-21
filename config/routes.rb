Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api', format: :json do
    resources :teams
  end
  resource :team_dashboard
  resource :auth, controller: :authentication

  root to: "landing#show"
end
