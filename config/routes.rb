Rails.application.routes.draw do
  devise_for :users

  with_options controller: :pages do
    get :about
    get :privacy
    get :terms
  end

  root to: "pages#home"
end
