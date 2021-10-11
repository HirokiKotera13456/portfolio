Rails.application.routes.draw do
  root "homes#top"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
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
  resources :rooms
end
