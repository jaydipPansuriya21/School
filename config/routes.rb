Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'courses/', to: "courses#index"
      post 'courses/', to: "courses#create"
      get 'tutors/', to: "courses#show_tutor"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
