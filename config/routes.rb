Rails.application.routes.draw do
  resources :question_sets do
    resources :questions

    post :reset, on: :member
    get  :test, on: :member
  end

  root 'question_sets#index'
end
