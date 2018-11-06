class Api::V1::GifController < ApplicationController
  def index
    dark_sky = LocationSearch.new(params[:location]).get_results
    result = GiphyApiBuilder.new(dark_sky).return_response
    render json: result
  end
end
