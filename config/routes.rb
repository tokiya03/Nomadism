Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # namespace :public do
  #   get 'groups/new'
  #   get 'groups/show'
  #   get 'groups/edit'
  #   get 'groups/index'
  # end
  # namespace :public do
  #   get 'posts/new'
  #   get 'posts/index'
  #   get 'posts/show'
  #   get 'posts/edit'
  # end
  # namespace :public do
  #   get 'users/mypage'
  #   get 'users/edit'
  #   get 'users/show'
  #   get 'users/confirm'
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
