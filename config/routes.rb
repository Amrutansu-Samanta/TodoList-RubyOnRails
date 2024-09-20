Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  get "/index" , to: "root#index"
  get "/contact" , to: "root#contact"
  get "/about" , to: "root#about"
  get "/jsonresponse" , to: "root#jsonresponse"
  get "/user/:id/:name" , to: "root#userdetails"
  post "/add" , to: "root#add"
  delete "/delete/:id" , to: "root#delete"
  get "/search" , to: "root#search"
end
