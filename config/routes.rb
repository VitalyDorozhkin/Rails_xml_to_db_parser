Rails.application.routes.draw do
  get 'batch/new'
  post 'batch/new', to: 'batch#create'
  root to: 'batch#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
