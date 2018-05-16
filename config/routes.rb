Rails.application.routes.draw do
  get 'drugs/query', to: 'drugs#query'
end
