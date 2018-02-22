class SearchPlacesService

  def initialize
    @conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/place/textsearch/json")
    @key = ENV['GOOGLE_PLACES_KEY']
  end

  def search(q)
    response = conn.get "", { query: q, key: key }
    results = JSON.parse(response.body)["results"]

    parse_results(results)
  end

  private

    attr_reader :conn, :key

    def parse_results(results)
      results.map do |result|
        {
          "name": result["name"],
          "address": result["formatted_address"],
          "place_id": result["place_id"]
        }
      end[0..4]
    end

end
