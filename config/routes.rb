Rails.application.routes.draw do
  root "homes#top"
  devise_for :users
  get 'maps/index'
  get 'maps/index'
  get 'maps/kyoto'
  get 'maps/hyogo'
  get 'maps/osaka'
  get 'maps/nara'
  get 'maps/wakayama'
  get 'maps/shiga'
  resources :dogs, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :dog_comments, only: [:create, :destroy] do
      resource :comment_favorites, only: [:create, :destroy]
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
end
