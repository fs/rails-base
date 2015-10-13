Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }

  resource :feedback, only: %i(new create)
  resources :social_profiles, only: :destroy

  with_options controller: :pages do
    get :about
    get :privacy
    get :terms
  end

  root to: "pages#home"
end
