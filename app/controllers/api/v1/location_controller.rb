class Api::V1::LocationController < ApplicationController
  def index
    result = GoogleGeoRequest.new(params[:location]).get_location
    render json: result
  end
end