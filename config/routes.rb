Collaborator::Application.routes.draw do
  get "subscriptions/index"

  get "subscriptions/edit"

  scope '/admin' do
    resources :settings
    resources :organizations
  end

  resources :projects do
    resources :topics do
      resources :comments
    end
  end

  resources :subscriptions do
    member do
      get 'toggle'
    end
  end


  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: redirect('/projects')
  
end
