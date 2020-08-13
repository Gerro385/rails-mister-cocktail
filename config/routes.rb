Rails.application.routes.draw do

  resources :cocktails, only: [ :new, :create, :index, :show ] do
    resources :doses, only: [ :new, :create, :destroy ]
  end
end
