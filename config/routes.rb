Rails.application.routes.draw do
  root 'home#index'

  resources :promotions, only: [:index, :show, :new, :create]
end
