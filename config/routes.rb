Rails.application.routes.draw do
  root 'tests#index'
  resources :tests, shallow: true do
    resources :questions, only: %i[show edit update destroy new create] do
      resources :answers, shallow: true, except: :index
    end
  end
end
