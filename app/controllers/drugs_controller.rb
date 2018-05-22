class DrugsController < ApplicationController
  def query
    drugs = NdcProduct.search(search_params[:search].capitalize)
    render json: drugs, status: :ok
  end

  def specific_drug
    drug = NdcProduct.find_drug(search_params[:search].capitalize)
    render json: drug, status: :ok
  end

  def dosage_strength
    drug = NdcProduct.get_strength(search_params[:search].capitalize, search_params[:dose_form])
    render json: drug, status: :ok
  end

  private

  def search_params
    params.permit(:search, :dose_form)
  end
end
