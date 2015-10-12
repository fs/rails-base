Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }

  resources :social_profiles, only: :destroy
  root to: "pages#home"
end
