Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  get '/inicio', to: "welcome#index"
  resources :coins # cria rotas default de CRUD para a entidade de Moedas

  root to: "welcome#index"
end
