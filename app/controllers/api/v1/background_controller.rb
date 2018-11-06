class Api::V1::BackgroundController < ApplicationController
  def index
    result = LocationSearch.new(params[:location]).get_photos
    render json: result
  end
end
