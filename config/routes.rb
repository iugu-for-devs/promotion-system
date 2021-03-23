Rails.application.routes.draw do
  root 'home#index'

  resources :promotions, only: %i[index show new create] do
    post 'generate_coupons', on: :member
  end
  resources :coupons, only: [] do
    post 'disable', on: :member
  end
end
