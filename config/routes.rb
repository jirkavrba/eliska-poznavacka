Rails.application.routes.draw do
  resources :question_sets do

    resources :questions, except: [:show] do

      post :correctly_answered, on: :member
      post :incorrectly_answered, on: :member
    end

    get :test, on: :member
    get :next_question, on: :member

    post :reset, on: :member

  end

  get '/static-test/unit-conversion', to: 'static_test_page#units_conversion'

  root 'question_sets#index'
end
