Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administrator', as: 'rails_admin'
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'about/index'

  resources :profile

  namespace :admin do
    resources :brands, :car_models, :break_categories, :break_sub_categories
    resources :garages, :users
  end

  resources :tire_stations, :car_washes, :services

  resources :garages do
    resources :garage_comments
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
