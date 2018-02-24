require 'rails_helper'

describe "Basic Info Endpoint" do
  it "can return the basic information of a location by place_id" do
    VCR.use_cassette("basic_info_jims") do
      get '/api/v1/basic-info?place_id=ChIJMfVOsJ7IxokRKNz9ctvYNG4'

      expect(response).to be_success

      basic_info = JSON.parse(response.body, symbolize_names: true)

      expect(basic_info).to have_key(:name)
      expect(basic_info).to have_key(:address)
      expect(basic_info).to have_key(:phone_number)
      expect(basic_info).to have_key(:hours)
      expect(basic_info).to have_key(:website)
    end
  end

  it "can return the basic information of a location by place_id" do
    VCR.use_cassette("basic_info_rmnp") do
      get '/api/v1/basic-info?place_id=ChIJ6QNZReR5aYcRF4KOp0PuJ_o'

      expect(response).to be_success

      basic_info = JSON.parse(response.body, symbolize_names: true)

      expect(basic_info).to have_key(:name)
      expect(basic_info).to have_key(:address)
      expect(basic_info).to have_key(:phone_number)
      expect(basic_info).to have_key(:hours)
      expect(basic_info).to have_key(:website)
    end
  end

end
