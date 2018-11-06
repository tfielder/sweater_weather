class GiphyApiBuilder
  def initialize(location)
    @dark_sky =  LocationSearch.new(location).get_results
  end

  def return_response
    {
      data: {
              images: array_builder
            },
      copyright: "2018"
    }
  end

  private

  def weekly_outlook
    @dark_sky["daily"]["data"]
  end

  def array_builder
    outlook = weekly_outlook.map do |hash|
      new_hash = {}
      new_hash[:time] = hash["time"]
      new_hash[:summary] = hash["summary"]
      new_hash[:url] = GiphyRequest.new(hash["summary"]).get_url
      new_hash
    end
  end
end