Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  get 'home/about' => 'homes#about', as: "about"
  get "users/:id" => "users#show", as: :mypage
  resources :users , only: [:show, :index, :edit, :new, :destroy, :update]
  resources :books
  patch 'books/:id' => 'books#update', as: 'update_book'

end
