require 'rails_helper'

describe 'api/v1/forecast' do
  it 'returns a successful response' do
    VCR.use_cassette("denver_request") do
      get '/api/v1/forecast?location=denver,co'
    end

    expect(response).to be_successful

    VCR.use_cassette("kansascity_request") do
      get '/api/v1/forecast?location=kansascity,ks'
    end

    expect(response).to be_successful

    VCR.use_cassette("real_address_request") do
      get '/api/v1/forecast?location=1426highstreet,denver,co'
    end

    expect(response).to be_successful
  end
end