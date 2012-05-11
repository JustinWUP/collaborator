Githubbug::Application.routes.draw do
  scope '/admin' do
    resources :settings
    resources :organizations
    resources :topics
  end

  resources :projects do
    # get 'topics/:topic_id', controller: "topics", action: "show", as: "topic"

    resources :topics do
      resources :comments
    end
  end


  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: redirect('/projects')
  
end
