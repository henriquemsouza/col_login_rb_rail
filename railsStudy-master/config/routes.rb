Rails.application.routes.draw do
	scope ":locale" do
	  resources :rooms
	  resources :users
	end

	resource :confirmation, only: [:show]
	resource :user_sessions, only: [:create,:new,:destroy]

	resources :rooms do 
		resources :reviews, only: [:create, :update], module: :rooms
	end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
