require 'rails_helper'

describe "Weather Endpoint" do
  it "returns weather data given a latitude, longitude, and two, nearby dates" do
    VCR.use_cassette("weather_philly") do
      get '/api/v1/weather?latitude=39.9415559&longitude=-75.1493097&dates=03010303'

      expect(response).to be_success

      weather_info = JSON.parse(response.body, symbolize_names: true)

      expect(weather_info).to have_key(:avg_high)
      expect(weather_info).to have_key(:avg_low)
      expect(weather_info).to have_key(:avg_precip)
      expect(weather_info).to have_key(:chance_windy)
      expect(weather_info).to have_key(:chance_humid)
      expect(weather_info).to have_key(:chance_cloudy)
    end
  end
end
