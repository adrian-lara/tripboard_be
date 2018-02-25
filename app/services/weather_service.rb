class WeatherService

  def initialize(params)
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @dates = params[:dates]
    @conn = Faraday.new("http://api.wunderground.com/api/8844b64a44cc0a22")
  end

  def summary
    geolookup_endpoint
    planner_endpoint
  end

  private

    attr_reader :latitude,
                :longitude,
                :dates,
                :conn,
                :state,
                :city

    def geolookup_endpoint
      raw_response = conn.get "geolookup/q/#{latitude},#{longitude}.json"
      response = JSON.parse(raw_response.body, symbolize_names: true)
      parse_city_state(response)
    end

    def parse_city_state(response)
      @state = response[:location][:state]
      @city = response[:location][:city]
    end

    def planner_endpoint
      raw_response = conn.get "planner_#{dates}/q/#{state}/#{city}.json"
      response = JSON.parse(raw_response.body, symbolize_names: true)
      parse_summary(response)
    end

    def parse_summary(response)
      {
        avg_high: response[:trip][:temp_high][:avg][:F],
        avg_low: response[:trip][:temp_low][:avg][:F],
        avg_precip: response[:trip][:precip][:avg][:in],
        chance_windy: response.dig(:trip, :chance_of, :chanceofwindyday, :percentage),
        chance_humid: response.dig(:trip, :chance_of, :chanceofhumidday, :percentage),
        chance_cloudy: response.dig(:trip, :chance_of, :chanceofcloudyday, :percentage),
      }
    end

end
