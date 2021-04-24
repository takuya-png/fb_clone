Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/show'
  root 'users# new'
    resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create, :destroy]
    resources :picture_blogs do
    collection do
      post :confirm
    end
  end
end
