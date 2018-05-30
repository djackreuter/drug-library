class DrugsController < ApplicationController
  def query
    if search_params[:search] == ''
      raise ArgumentError, 'No search params specified'
    end
    drugs = NdcProduct.search(search_params[:search].capitalize)
    render json: drugs, status: :ok
  end

  # def specific_drug
  #   drug = NdcProduct.find_drug(search_params[:product_id])
  #   render json: drug, status: :ok
  # end

  # def dosage_strength
  #   drug = NdcProduct.get_strength(search_params[:search].capitalize, search_params[:dose_form])
  #   render json: drug, status: :ok
  # end

  private

  def search_params
    params.permit(:search, :dose_form, :product_id)
  end
end
