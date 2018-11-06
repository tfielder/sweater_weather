class Api::V1::GifController < ApplicationController
  def index
    result = LocationSearch.new(params[:location]).get_response
    render json: result
  end
end
