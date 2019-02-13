Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'events#index'
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :events, only: [:index, :new, :show, :create, :destroy] do
    resources :participations, only: [:new, :index, :show, :create, :destroy]
  end
end
