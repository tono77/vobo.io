Rails.application.routes.draw do
  resources :logs
  resources :sols
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        invitations: 'users/invitations'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sols#index'
  get '/current_vobos' => 'sols#current_vobos'
end
