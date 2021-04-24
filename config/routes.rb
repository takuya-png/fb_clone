Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :picture_blogs do
    collection do
      post :confirm
    end
  end
end
