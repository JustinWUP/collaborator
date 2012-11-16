Collaborator::Application.routes.draw do

  resources :apps

  resources :wikis do
    member do
      get 'audit'
      get 'revert'
    end
  end
   match 'wikis/:id/:next/audit/' => "wikis#audit"
   match 'wikis/:id/:next/revert/' => "wikis#revert"
   match 'wikis/all/archives' => "wikis#archives"
   match 'wikis/all/cate' => "wikis#catearchives" 

  match 'wikis/cate/:postcategory' => "wikis#cate"


  get "subscriptions/index"

  get "subscriptions/edit"

  scope '/admin' do
    resources :settings
    resources :organizations
  end

  # resources :projects do
  #   resources :topics do
  #     member do
  #       get 'addmore'
  #       get 'attach'
  #     end
  #       resources :comments
  #     end
  #   end


  resources :projects do
    resources :topics do
      member do
        get 'attach'
      end
      resources :comments
    end
  end

  resources :topics do
    resources :tasks
  end


match "/projects/:id/topics/:id/attach" => "topics#attach"

  resources :subscriptions do
    member do
      get 'toggle'
      get 'unsub'
    end
  end

     match ':controller(/:action(/:id))(.:format)'


  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: redirect('/projects')
  
end
