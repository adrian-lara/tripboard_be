class BasicInfoService

  def initialize
    @conn = Faraday.new("https://maps.googleapis.com/maps/api/place/details/json")
    @key = ENV['GOOGLE_PLACES_KEY']
  end

  def basic_info(place_id)
    response = conn.get "", { place_id: place_id, key: key }
    raw_info = JSON.parse(response.body, symbolize_names: true)

    parse_info(raw_info[:result])
  end

  private

    attr_reader :conn, :key

    def parse_info(full_info)
      {
        name: full_info[:name],
        address: full_info[:formatted_address],
        phone_number: full_info[:formatted_phone_number],
        hours: (
          full_info.dig(:opening_hours, :weekday_text) ||
          full_info.dig(:opening_hours, :periods)
        ),
        website: full_info[:website],
      }
    end

end
