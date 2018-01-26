Rails.application.routes.draw do
  root 'links#index'
  get "/links/:id", to: "links#show"
  post "/links", to: "links#create"
  post "/", to: "links#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/:short_url", to: "links#forward"
end
