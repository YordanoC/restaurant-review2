Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about' => 'pages#about'
  # resources :countries, only: [:index, :show] do
  #   collection do
  #    get 'restaurant_country'
  # end
  resources :restaurants, only: [:index, :show]
end
