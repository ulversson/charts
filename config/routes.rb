Rails.application.routes.draw do
  root to: "charts#index"
  get "charts/:name", to: "charts#show", as: :chart
end
