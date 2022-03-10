Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "result", to: "developers#displayresult"


  post "search", to: "developers#get"
  get "search", to: "developers#new"

  get "edit/:id/delete/:iid", to: "developers#destroy_interview"
  get "edit/:id", to: "developers#edit"
  post "edit/:id", to: "developers#createinterview"

  get "edit/:id/increase", to: "developers#increase"
  get "edit/:id/descrease", to: "developers#descrease"

  get "/", to: "developers#index"
end
