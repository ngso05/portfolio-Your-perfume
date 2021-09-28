Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'withdraw'
      patch 'withdraw'
      get 'unsubscribe'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
