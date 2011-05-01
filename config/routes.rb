TicketsTickets::Application.routes.draw do
  root :to => "static#index"
  
  devise_for :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
  end 
  
  namespace :users do
    root :to => "clients#index"
  end
  
  resources :users, :only => :show
  
end