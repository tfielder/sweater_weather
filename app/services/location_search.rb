class LocationSearch
  def initialize(location)
    @location = location
    @coordinates = get_google_geo_response
  end

  def get_results
    get_dark_sky_response
  end

  def get_photos
    get_flikr_response
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
    results = JSON.parse(response.body)
    results = results["results"][0]["geometry"]["location"]
  end

  def get_dark_sky_response
    response = connection("https://api.darksky.net/forecast/#{ENV['dark_sky_api_key']}/#{@coordinates["lat"]},#{@coordinates["lng"]}").get
    results = JSON.parse(response.body)
  end

  def get_flikr_response
    response = connection("https://api.flickr.com/services/rest/").get, keys
    results = JSON.parse(response.body)
    binding.pry
  end

  def keys
    {
      :method => 'flickr.photos.search',
      :api_key => ENV['flickr_api_key'],
      :lat => "#{@coordinates["lat"]}",
      :lon => "#{@coordinates["lng"]}",
      :safe_search => "1",
      :content_type => "1",
      :format => "json",
      :nojsoncallback => "1"
    }
  end
end