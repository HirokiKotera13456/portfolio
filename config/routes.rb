Rails.application.routes.draw do
  get 'maps/index'
  root "homes#top"
  devise_for :users
  get 'maps/index'
  resources :dogs, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :dog_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
end
