Rails.application.routes.draw do
 
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'pages/home'
  get 'pages/about'
  
  root to: "pages#home"
end
