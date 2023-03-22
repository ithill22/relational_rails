Rails.application.routes.draw do
 get "/conferences", to: "conferences#index"
 get "/conferences/:id", to: "conferences#show"
 get "/teams", to: "teams#index"
 get "/teams/:id", to: "teams#show"
 get "/conference/:conference_id/teams", to: "conferences/teams#index"
end
