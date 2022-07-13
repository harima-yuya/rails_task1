Rails.application.routes.draw do
  get 'posts/index'
  get "posts", to: "posts#index"
  get 'posts/add'
  post "posts/add", to: "posts#create"
  get 'posts/edit'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
