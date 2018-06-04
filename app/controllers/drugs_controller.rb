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

  def ndc_number
    ndc_num = NdcProduct.get_ndc_num(search_params[:name], search_params[:dose_form], search_params[:strength])
    render json: {ndc_code: ndc_num}, status: :ok
  end

  def specific_drug
    drug = NdcProduct.find_drug(search_params[:name])
    render json: drug, status: :ok
  end

  def dosage_strength
    drug = NdcProduct.get_strength(search_params[:search].capitalize, search_params[:dose_form])
    render json: drug, status: :ok
  end

  def drug_info
    drug = NdcProduct.get_drug_info(search_params[:search].capitalize)
    render json: drug, status: :ok
  end

  def throw_error
    raise ArgumentError, 'No search params specified'
  end

  private

  def search_params
    params.permit(:search, :dose_form, :name, :strength)
  end
end
