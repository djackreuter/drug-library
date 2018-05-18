Rails.application.routes.draw do
  get 'drugs/query', to: 'drugs#query'
  get 'drugs/specific_drug', to: 'drugs#specific_drug'
end
