Rails.application.routes.draw do
  root "homes#top"
  devise_for :users

  resources :dogs, only: [:new, :create, :index, :show, :destroy, :edit, :update] 
  resources :users, only: [:show, :edit, :update, :index]
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
end
