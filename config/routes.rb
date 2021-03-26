Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :promotions, only: %i[index show new create edit update] do
    post 'generate_coupons', on: :member
  end
  resources :coupons, only: [] do
    post 'disable', on: :member
  end
end
