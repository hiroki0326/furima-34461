Rails.application.routes.draw do
  get 'order/deliver'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create, :new]
  end
end
