Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'sessions#new'
  resources :picture_blogs do
    collection do
      post :confirm
    end
  end
end
