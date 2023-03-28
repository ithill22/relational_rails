Rails.application.routes.draw do
 get "/conferences", to: "conferences#index"
 get "/conferences/new", to: "conferences#new"
 post "/conferences", to: "conferences#create"
 get "/conferences/:id", to: "conferences#show"
 get "/conferences/:id/edit", to: "conferences#edit"
 patch "/conferences/:id", to: "conferences#update"
 delete "/conferences/:id", to: "conferences#destroy"
 get "/conferences/:conference_id/teams", to: "conferences/teams#index"
 get "/conferences/:conference_id/teams/new", to: "conferences/teams#new"
 post "/conferences/:conference_id/teams", to: "conferences/teams#create"

 get "/teams", to: "teams#index"
 get "/teams/:id", to: "teams#show"
 get "/teams/:id/edit", to: "teams#edit"
 patch "/teams/:id", to: "teams#update"
end
