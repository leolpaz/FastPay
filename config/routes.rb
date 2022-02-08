Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#create'
    get '/users/sign_up' => 'devise/registrations#new'
  end
  root "splash#index"
  resources :groups, only: [:index, :create] do
  end
  get '*unmatched_route', to: 'user#index'
end
