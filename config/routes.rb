Rails.application.routes.draw do
  get 'health/index'
  resources :secret_menu_items, only: %i[index show create update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
