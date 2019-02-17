Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :pets, except: [:show]
    resources :appointments
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'all_appointments', to: 'appointments#all', as: 'all_appointments'
  post 'appointments/:id/update_status', to: 'appointments#update_status', as: 'update_status'
  # post 'appointments/:id/decline', to: 'appointments#decline_appointment', as: 'decline_appointment'
end
