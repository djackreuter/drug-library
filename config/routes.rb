Rails.application.routes.draw do
  get 'drugs/query', to: 'drugs#query'
  get 'drugs/specific_drug', to: 'drugs#specific_drug'
  get 'drugs/strength', to: 'drugs#dosage_strength'
end
