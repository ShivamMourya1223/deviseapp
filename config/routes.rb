Rails.application.routes.draw do
	
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
 
  root 'posts#index'
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
