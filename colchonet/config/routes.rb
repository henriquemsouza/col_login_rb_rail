Rails.application.routes.draw do
  #$scope "(:locale)", :locale => /en|pt\-BR/ do
   get 'home/index'
   
   resources :users
   resources :rooms
   resource :confirmation, :only => [:show]
   resource :user_sessions, :only => [:create, :new, :destroy]
 # end
   root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
