Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: :home
  post "/", to: "pages#create"
  get "/pages/cv" => "pages#cv"
  resources :pages, only: [:home, :new, :create]
end
