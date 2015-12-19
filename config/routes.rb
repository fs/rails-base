Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resource :feedback, only: %i(new create)
  resources :social_profiles, only: :destroy
  match "/users/:id/finish_signup" => "users#finish_signup", via: %i(get patch), as: :finish_signup

  with_options controller: :pages do
    get :about
    get :privacy
    get :terms
  end

  root to: "pages#home"
end
