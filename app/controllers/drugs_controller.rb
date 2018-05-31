class DrugsController < ApplicationController
  def query
    if search_params[:search] == ''
      throw_error
    end
    drugs = NdcProduct.search(search_params[:search].capitalize)
    render json: drugs, status: :ok
  end

  def query_distinct
    if search_params[:search] == ''
      throw_error
    end
    drugs = NdcProduct.search_name(search_params[:search].capitalize)
    render json: drugs, status: :ok
  end

  def throw_error
    raise ArgumentError, 'No search params specified'
  end

  def specific_drug
    drug = NdcProduct.find_drug(search_params[:name])
    render json: drug, status: :ok
  end

  def dosage_strength
    drug = NdcProduct.get_strength(search_params[:search].capitalize, search_params[:dose_form])
    render json: drug, status: :ok
  end

  private

  def search_params
    params.permit(:search, :dose_form, :name)
  end
end
