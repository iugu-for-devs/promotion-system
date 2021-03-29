Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :promotions do
    post 'generate_coupons', on: :member
    get 'search', on: :collection
  end
  resources :coupons, only: [] do
    post 'disable', on: :member
  end
end
