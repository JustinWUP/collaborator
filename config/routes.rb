Githubbug::Application.routes.draw do
    scope '/admin' do
      resources :settings
      resources :organizations
    end

  resources :projects do
    # get 'issues/:issue_id', controller: "issues", action: "show", as: "issue"
    resources :issues do
      resources :comments
    end
  end


  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: redirect('/projects')
  
end
