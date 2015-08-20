Rails.application.routes.draw do
  devise_for :users
  resource :feedback, only: %i(new create)
  root to: "pages#home"
end
