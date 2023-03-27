Rails.application.routes.draw do
 get "/conferences", to: "conferences#index"
 get "/conferences/new", to: "conferences#new"
 post "/conferences", to: "conferences#create"
 get "/conferences/:id", to: "conferences#show"
 get "/conferences/:id/edit", to: "conferences#edit"
 patch "/conferences/:id", to: "conferences#update"
 get "/conferences/:conference_id/teams", to: "conferences/teams#index"

 get "/teams", to: "teams#index"
 get "/teams/:id", to: "teams#show"
end
