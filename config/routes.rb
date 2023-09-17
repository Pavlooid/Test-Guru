Rails.application.routes.draw do

  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
  get :about, to: 'sessions#about'

  resources :users, only: :create
  resources :sessions, only: :create

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
