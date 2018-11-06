class Api::V1::GifController < ApplicationController
  def index


    dark_sky = LocationSearch.new(params[:location]).get_results
    result = LocationSearch.new(params[:location]).get_giphy
    response = GiphyApiBuilder.new(dark_sky, result).return_response

    render json: result
  end
end
