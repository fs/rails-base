Features::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  match 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
  match 'logout', :to  => 'devise/sessions#destroy', :as => 'destroy_user_session'
  match 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'

  root :to => 'dashboard#index'
end
