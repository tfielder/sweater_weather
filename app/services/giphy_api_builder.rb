class GiphyApiBuilder
  def initialize(location)
    @dark_sky =  LocationSearch.new(location).get_dark_sky
  end

  def return_response
    {
      data: {
              images: five_day_array
            },
      copyright: "2018"
    }
  end

  private

  def weekly_outlook
    @dark_sky["daily"]["data"]
  end

  def five_day_array
    array_builder[0..4]
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