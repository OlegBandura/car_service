Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'about/index'

  namespace :admin do
    resources :brands, :car_models, :break_categories, :break_sub_categories, :garages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
