Collaborator::Application.routes.draw do
  get "subscriptions/index"

  get "subscriptions/edit"

  scope '/admin' do
    resources :settings
    resources :organizations
  end

  resources :projects do
    resources :topics do
      member do
      get 'addmore'
      get 'attach'
    end
        resources :comments
      end
    end

match "/projects/:id/topics/:id/attach" => "topics#attach"
# match "/suspended" =>"projects#suspended"

  resources :subscriptions do
    member do
      get 'toggle'
    end
  end

    # match ':controller(/:action(/:id))(.:format)'


  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: redirect('/projects')
  
end
