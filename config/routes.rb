Rails.application.routes.draw do
  devise_for :users

  resource :feedback, only: %i(new create)

  with_options controller: :pages do
    get :about
    get :privacy
    get :terms
  end

  root to: "pages#home"
end
