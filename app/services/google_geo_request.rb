class GoogleGeoRequest
  attr_reader :coordinates

  def initialize(location)
    @location = location
    @coordinates = calculate_coordinates
  end

  def get_location
    parse(get_google_geo_response)
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def get_google_geo_response
    response = connection('https://maps.googleapis.com/maps/api/geocode/').get 'json', {:address => "#{@location}", :key => "#{ENV['google_api_key']}"}
  end

  def parse(result)
    JSON.parse(result.body)
  end

  def calculate_coordinates
    parse(get_google_geo_response)["results"][0]["geometry"]["location"]
  end
end