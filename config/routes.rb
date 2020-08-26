Rails.application.routes.draw do
  resources :sessions
  resources :blogs do
    member do
      get :top
    end
  end
  root to: "blogs#top"
  resources :users
end
