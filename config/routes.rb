Rails3Base::Application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }

  root to: 'dashboard#index'
end
