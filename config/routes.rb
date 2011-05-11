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
  
  resources :companies
  
  resources :users do
    resources :tickets do
      resources :replies do
        collection do
          post :create, :action => :create_for_ticket
        end
      end
    end
  end
  
  # Tickets routes
  resources :tickets
  
  match '/tickets/status/:status' => 'tickets#index', :as => :tickets_status
  match '/ticket/:number' => 'tickets#show', :as => :show_ticket
  match '/ticket/:number/edit' => 'tickets#edit', :as => :edit_ticket
  
end
