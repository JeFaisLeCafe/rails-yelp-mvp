Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"
  resources(:restaurants, only: [ :index, :create, :new, :show ]) do
    resources :reviews, only: [ :new, :create, :show ]
    collection do                       # collection => no restaurant id in URL
      get 'top', to: "restaurants#top"  # RestaurantsController#top
    end
  end
end
