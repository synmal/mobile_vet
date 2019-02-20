Rails.application.routes.draw do
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'admin_constraint'
  mount Sidekiq::Web => '/sidekiq', :constraints => AdminConstraint.new
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin', :constraints => AdminConstraint.new
  
  resources :users do
    resources :pets, except: [:show]
    resources :appointments, shallow: true do
      resources :diagnoses
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'pending', to: 'appointments#pending', as: 'pending_appointments'
  get 'accepted', to: 'appointments#accepted', as: 'accepted_appointments'
  get 'declined', to: 'appointments#declined', as: 'declined_appointments'
  post 'appointments/:id/update_status', to: 'appointments#update_status', as: 'update_status'
  get 'all_upcoming', to: 'appointments#all_upcoming', as: 'all_upcoming_appointments'
end
