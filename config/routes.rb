Rails.application.routes.draw do
  resources :blogs do
    member do
      get :top
    end
  end
  root to: "blogs#top"
end
