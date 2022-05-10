Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :users
  get 'home/about' => 'homes#about', as: "about"
  get 'books' => 'books#index'
  get 'users/:id/edit' => 'users#edit'

  resources :books do
    collection do
    get 'books'
    end
  end
end
