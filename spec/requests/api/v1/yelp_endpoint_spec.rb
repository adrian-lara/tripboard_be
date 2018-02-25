require 'rails_helper'

describe "Yelp Endpoint" do
  it "returns business's rating, review count, and Yelp url given name, int phone number, and location" do
    VCR.use_cassette("yelp_jims") do
      get "/api/v1/yelp?name=Jims+Steaks&phone=12159281911&latitude=39.9415559&longitude=-75.1493097"

      expect(response).to be_success

      yelp_info = JSON.parse(response.body, symbolize_names: true)

      expect(yelp_info).to have_key(:rating)
      expect(yelp_info).to have_key(:review_count)
      expect(yelp_info).to have_key(:yelp_url)
    end
  end
end
