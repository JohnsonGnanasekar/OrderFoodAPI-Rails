Rails.application.routes.draw do
  default_url_options :host => "localhost"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :customers, only: %w[show] do
      resources :orders, :only => [:show, :create]
    end
    resources :products
  end

  devise_for :customers,
             defaults: { format: :json },
             path: '',
             path_names: {
                 sign_in: 'api/login',
                 sign_out: 'api/logout',
                 registration: 'api/signup'
             },
             controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
             }
end
