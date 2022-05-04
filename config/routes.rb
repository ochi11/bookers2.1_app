Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resource :users
  resource :books
  get 'home/about' => 'homes#about', as: "about"
end
