class Api::V1::ForecastController < ApplicationController
  def index
    result = LocationSearch.new(params[:location]).get_response
    # render json: result

  end

  # private
  # def forecast_params
  # end
end
