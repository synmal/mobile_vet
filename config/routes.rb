Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
end
