TicketsTickets::Application.routes.draw do

  root :to => "static#index"
  
  devise_for :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
  end

  match '/dashboard' => 'dashboards#dashboard'
  
  resources :companies do
    resources :locations do
      collection do
        post :create, :action => :create_for_company
      end
      member do
        delete :destroy, :action => :destroy_for_company
      end
    end
  end
  
  resources :tasks
  
  # Assets routes
  resources :assets
  
  match '/assets/classification/:classification' => 'assets#index', :as => :assets_classification
  
  # Users routes
  resources :users do
    resources :tickets do
      resources :replies do
        collection do
          post :create, :action => :create_for_ticket
        end
      end
    end
    collection do
      put :company, :action => :add_to_company
    end
  end
  
  # Tickets routes
  resources :tickets
  
  match '/tickets/status/:status' => 'tickets#index', :as => :tickets_status
  match '/ticket/:number' => 'tickets#show', :as => :show_ticket
  match '/ticket/:number/edit' => 'tickets#edit', :as => :edit_ticket
  
  
  # GridFS Routes
  require File.join Rails.root, 'lib/grid_io'
    Mongo::GridIO.send(:include, TicketsTickets::GridIO)
    match "/gridfs/*path", :via => :get, :to => proc { |env|
      gridfs_path = env["PATH_INFO"].gsub("/gridfs/", "")
      begin
        gridfs_file = Mongo::GridFileSystem.new(Mongoid.database).open(gridfs_path, 'r')
        [ 200, { 'Content-Type' => gridfs_file.content_type, 'Content-Length' => gridfs_file.file_length.to_s }, gridfs_file ]
      rescue
        message = 'Grid file not found.'
        [ 404, { 'Content-Type' => 'text/plain', 'Content-Length' => message.size.to_s }, message ]
      end
    }

end
