Rails.application.routes.draw do
  root 'tests#index'
  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, shallow: true, except: :index
    end
      post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
      get :result, on: :member
  end
end
