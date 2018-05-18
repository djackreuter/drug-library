class DrugsController < ApplicationController
  def query
    drugs = NdcProduct.search(search_params)
    render json: drugs, status: :ok
  end

  def specific_drug
    drug = NdcProduct.find_drug(search_params)
    render json: drug, status: :ok
  end

  private

  def search_params
    params.permit(:search)[:search].capitalize
  end
end
