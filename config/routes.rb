Rails.application.routes.draw do
  # routers then understands the following:
  # http://localhost:3000/articles/
  # http://localhost:3000/articles/new
  resources :articles
end
