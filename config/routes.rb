Rails.application.routes.draw do
  get 'posts/index'
  get "posts", to: "posts#index"
  get 'posts/add'
  post "posts/add", to: "posts#create"
  
  get 'posts/:id', to: "posts#show"

  get 'posts/edit/:id', to: "posts#edit"
  patch 'posts/edit/:id', to: "posts#edit"

  get "posts/delete/:id", to: "posts#delete"
end
