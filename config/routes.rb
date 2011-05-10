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

  match '/dashboard' => 'dashboards#dashboard'
  
  resources :users do
    resources :tickets do
      resources :replies
    end
  end
  
  # Tickets routes
  resources :tickets
  
  match '/tickets/status/:status' => 'tickets#index', :as => :tickets_status
  match '/ticket/:number' => 'tickets#show', :as => :show_ticket
  
end
