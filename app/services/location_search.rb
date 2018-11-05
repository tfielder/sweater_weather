class LocationSearch
  def initialize(location)
    @location = location
  end

  def get_response
    response = connection.get 'json', {:address => "#{@location}", :key => "#{ENV['google_api_key']}"}
    results = JSON.parse(response.body)
    results = results["results"][0]["geometry"]["location"]
    binding.pry
  end

  private
  def connection
    connect = Faraday.new(:url => 'https://maps.googleapis.com/maps/api/geocode/') do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end
end