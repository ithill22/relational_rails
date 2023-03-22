Rails.application.routes.draw do
 get "/conferences", to: "conferences#index"
 get "/conferences/:id", to: "conferences#show"
 get "/teams", to: "teams#index"
end
