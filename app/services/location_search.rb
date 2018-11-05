class LocationSearch
  def initialize(location)
    @location = location
    @coordinates = get_google_geo_response
  end

  def get_results
    get_dark_sky_response
  end

  private
  def connection(url)
    connect = Faraday.new(:url => "#{url}") do |f|
      f.request :url_encoded
      # f.headers ['Accept'] = 'application/json'
      # f.headers ['Content-Type'] = 'application/json'
      f.adapter Faraday.default_adapter
    end
  end

  def get_google_geo_response
    response = connection('https://maps.googleapis.com/maps/api/geocode/').get 'json', {:address => "#{@location}", :key => "#{ENV['google_api_key']}"}
    results = JSON.parse(response.body)
    results = results["results"][0]["geometry"]["location"]
  end

  def get_dark_sky_response
    response = connection("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates["lat"]},#{@coordinates["lng"]}").get
    results = JSON.parse(response.body)
  end
end