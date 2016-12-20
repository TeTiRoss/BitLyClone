Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :links, path: '', param: :name, only: [:new, :create, :show]

  root 'links#new'
end
