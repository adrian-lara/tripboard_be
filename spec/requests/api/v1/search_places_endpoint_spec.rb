require 'rails_helper'

describe "Search Places Endpoint" do
  it "returns JSON with a maximum of 5 place results each with description and place_id" do
    VCR.use_cassette 'search_np' do
      get '/api/v1/search-places?q=National+Parks+Colorado'

      expect(response).to be_success

      places = JSON.parse(response.body, { symbolize_names: true })

      expect(places.count <= 5 ).to be true
      places.each do |place|
        expect(place).to have_key(:name)
        expect(place).to have_key(:address)
        expect(place).to have_key(:place_id)
        expect(place).not_to have_key(:id)
      end
    end
  end
end
