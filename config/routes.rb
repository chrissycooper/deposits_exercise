Rails.application.routes.draw do
  resources :deposits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tradelines
end
