class Api::V1::GifController < ApplicationController
  def index


    dark_sky = LocationSearch.new(params[:location]).get_results
    giphy = LocationSearch.new(params[:location]).get_giphy
    result = GiphyApiBuilder.new(dark_sky, giphy).return_response
    binding.pry
    render json: result
  end
end
