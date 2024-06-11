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

    get 'search' => 'searches#search'

  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'dmin/sessions'
  }


  # namespace :public do
  #   get 'groups/new'
  #   get 'groups/show'
  #   get 'groups/edit'
  #   get 'groups/index'
  # end
  # namespace :admin do
  #   get 'groups/index'
  #   get 'groups/show'
  # end
  # namespace :admin do
  #   get 'posts/index'
  #   get 'posts/show'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
