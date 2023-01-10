Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do
    member do
      put "hide"
    end
  end

  resource :session, only: %i[new create destroy update]

  resources :users, except: [:index], param: :nickname

  resources :tags, only: [:show], param: :name

end
