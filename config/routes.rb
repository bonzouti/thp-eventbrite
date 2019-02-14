Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'events#index'
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :events do
    resources :participations
  end
end
