Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "posts#index"
  resource :posts, only: [:index, :create, :new]

  devise_scope :user do
    get '/users', to: redirect('/users/sign_in')
  end
end
