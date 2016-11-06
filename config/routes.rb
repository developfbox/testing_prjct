Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contacts' => 'static_pages#contacts'

  get 'signin' => 'static_pages#signin'

  get 'signup' => 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
