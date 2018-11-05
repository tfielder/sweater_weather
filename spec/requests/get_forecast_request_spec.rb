require 'rails_helper'

describe 'api/v1/forecast' do
  it 'returns a successful response' do
    VCR.use_cassette("denver_request") do
      get '/api/v1/forecast?location=denver,co'
    end

    forecast = JSON.parse(response.body)

    expect(response.body).to be_successful
  end
end