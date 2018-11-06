class PhotoSearch < ApplicationController
  def initialize(location)
    @location = location
    @coordinates = coordinates
  end

  def get_results
    
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_flikr_response
    # response = connection("https://api.flickr.com/services/rest/#{ENV['dark_sky_api_key']}/#{@coordinates["lat"]},#{@coordinates["lng"]}").get
    results = JSON.parse(response.body)
  end
end