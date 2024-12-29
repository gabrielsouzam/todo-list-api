Rails.application.routes.draw do
  resources :todo_lists, only: [ :create, :update, :destroy, :show, :index ] do
    member do
      get :tasks
    end
  end

  resources :tasks, only: [ :create, :update, :destroy ]

  get "up" => "rails/health#show", as: :rails_health_check
end
