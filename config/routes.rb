Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :feedbacks, only: %i(new create index)

  root to: "pages#home"
end
