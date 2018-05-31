Rails.application.routes.draw do
  get 'drugs/query', to: 'drugs#query'
  get 'drugs/specific_drug/:name', to: 'drugs#specific_drug'
  get 'drugs/strength', to: 'drugs#dosage_strength'
  get 'drugs/query_distinct', to: 'drugs#query_distinct'
end
