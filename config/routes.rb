Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/welcome', to: "welcome#show"
      get '/search-places', to: "search_places#index"
      get '/basic-info', to: "basic_info#show"
      get '/yelp', to: "yelp#show"
      get '/weather', to: "weather#show"
    end
  end

end
