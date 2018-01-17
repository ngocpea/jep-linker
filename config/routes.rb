Rails.application.routes.draw do
  root 'links#new'
  resources :links

  get "/:short_url", to: "links#redirect"
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
