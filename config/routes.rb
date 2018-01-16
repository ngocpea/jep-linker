Rails.application.routes.draw do
  root 'links#new'

  post "/", to: "links#create"
  get "/:short_url", to: "links#redirect"
  resources :links
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
