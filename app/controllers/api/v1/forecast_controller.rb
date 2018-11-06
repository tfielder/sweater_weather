class Api::V1::ForecastController < ApplicationController
  def index
    result = LocationSearch.new(params[:location]).get_results
    render json: result
  end
end
