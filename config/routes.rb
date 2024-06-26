Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    resources :users, only: [:edit, :show, :update, :destroy]
    get 'user/mypage' => 'users#mypage', as: 'mypage'
    patch 'user/confirm' => 'users#confirm', as: 'withdraw_confirm'
    patch 'user/withdraw' => 'users#withdraw', as: 'withdraw_user'

    resources :posts do
      resources :comments, only: [:create, :destroy]
    end

    resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :user_groups, only: [:create, :destroy]
      resources :chats, only: [:index, :create]
    end

    get 'search' => 'searches#search'
    get 'search_group' => 'searches#search_group'
    resource :map, only: [:show]
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'

    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :destroy]

    get 'search' => 'searches#search'
    get 'search_comment' => 'searches#search_comment'
    get 'search_group' => 'searches#search_group'
    resource :map, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
