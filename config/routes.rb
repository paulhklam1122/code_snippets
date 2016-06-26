Rails.application.routes.draw do
  root "categories#index"
  resources :categories
    # resources :snippets, only: [:show, :edit, :update, :destroy] do
    #   post :create, on: :collection
    # end
  resources :snippets
  resources :users
  get "/changepassword" => "users#change_password", as: :change_password
  patch "/changepassword" => "users#update_password"
  resource :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
