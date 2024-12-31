Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions"
}

  authenticated :user do
    root to: "todo_lists#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end

  resources :todo_lists, only: [ :create, :update, :destroy, :show, :index ] do
    member do
      get :tasks
    end
  end

  resources :tasks, only: [ :create, :update, :destroy ] do
    member do
      patch :update_status
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
