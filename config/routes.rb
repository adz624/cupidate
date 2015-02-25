Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'search' => 'home#search'
 
  post 'payment/callback', to: 'payment#callback'
 
  resources :profiles, only: [:index, :show]
 
  namespace :male do
    resources :orders, only: :new
    # index (s) collection
    # create - collection
    # show - member
    # update - member
    # invite - member
 
    resources :likes, only: [ :index ] do
      post :invite, on: :member
    end
  end
 
  namespace :female do
    resources :profiles, only: nil do
      post :like, on: :member
    end
    resources :invites, only: :index do
      post :yes, on: :member
      post :no, on: :member
    end
  end
 
  namespace :admin do
    resources :products
    resources :orders
    resources :invites
  end
end
