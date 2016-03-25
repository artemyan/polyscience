Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

#   frontend part
  root to: 'static_pages#index'
  resources :scientists, only: [:index, :show], formats: [:html, :json]
  resources :groups, only: [:index, :show], formats: [:html, :json]
end
