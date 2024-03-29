Rails.application.routes.draw do
  get 'drugs/query', to: 'drugs#query'
  get 'drugs/specific_drug/:name', to: 'drugs#specific_drug'
  get 'drugs/strength', to: 'drugs#dosage_strength'
  get 'drugs/query_distinct', to: 'drugs#query_distinct'
  get 'drugs/drug_info', to: 'drugs#drug_info'
  get 'drugs/ndc_number', to: 'drugs#ndc_number'
end
