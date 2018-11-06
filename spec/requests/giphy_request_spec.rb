require 'rails_helper'

describe 'API response from giphy' do
  describe '/api/v1/gifs/' do
    it 'returns a successful response' do
      VCR.use_cassette("giphy_request") do
        get '/api/v1/gifs/?location=denver,co'

        expect(response).to be_successful

        result = JSON.parse(response.body)
        expect(result.keys.include?("data")).to be(true)
        expect(result["data"]["images"][0].keys.include?("time")).to be(true)
        expect(result["data"]["images"][0].keys.include?("summary")).to be(true)
        expect(result["data"]["images"][0].keys.include?("url")).to be(true)
        expect(result.keys.include?("copyright")).to be(true)
        expect(result["data"]["images"].count).to eq(5)

      end
    end
  end
end
