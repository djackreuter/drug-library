class DrugsController < ApplicationController
  def query
    drugs = NdcProduct.search(search_params)
    render json: { status: 200, data: drugs }, status: :ok
  end

  private

  def search_params
    params.permit(:search)[:search].capitalize
  end
end
