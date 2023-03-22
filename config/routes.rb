Rails.application.routes.draw do
 get "/conferences", to: "conferences#index"
 get "/teams", to: "teams#index"
end
