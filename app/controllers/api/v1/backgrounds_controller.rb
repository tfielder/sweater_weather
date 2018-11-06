class Api::V1::BackgroundsController < ApplicationController
  def index
    result = PhotoSearch.new(params[:location]).get_results
    render json: result
  end
end
