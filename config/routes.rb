Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todolist do
      end
    end
    namespace :v2 do
      resources :todolist do
      end
    end
  end
end
