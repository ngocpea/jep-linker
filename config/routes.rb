Rails.application.routes.draw do
  root 'links#index'

  post "/", to: "links#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end