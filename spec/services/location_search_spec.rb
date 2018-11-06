require 'rails_helper'

describe 'Location Search' do
  it 'it exists' do
    search = LocationSearch.new("denver,co")
    expect(search).to be_a(LocationSearch)
  end
  it 'returns a successful response' do
    search = LocationSearch.new("denver,co")
  end
end