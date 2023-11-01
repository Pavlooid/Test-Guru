Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions'}

  get :about, to: 'sessions#about'

  resources :feedback, only: %i[create new]

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  resources :badges, only: :index
  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges
    resources :gists, only: :index
  end
end
