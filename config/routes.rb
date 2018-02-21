Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/welcome', to: "welcome#show"
      get '/search-places', to: "search_places#index"
    end
  end

end
