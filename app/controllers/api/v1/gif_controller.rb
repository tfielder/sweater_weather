class Api::V1::GifController < ApplicationController
  def index
    result = GiphyApiBuilder.new(params[:location]).return_response
    render json: result
  end
end
