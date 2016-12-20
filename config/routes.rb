Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :links, only: [:new, :create, :show] do
    get 'shortened', on: :collection
  end

  root 'links#new'
end
