Rails.application.routes.draw do

  mount_griddler

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  authenticate :user do
    resources :shoes do
      collection do
        get :listed, :sold
      end
    end
  end

  authenticate :user do
    resources :shoes, only: [:listed, :sold, :index, :show, :new, :create]
  end



 #resources :shoes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
