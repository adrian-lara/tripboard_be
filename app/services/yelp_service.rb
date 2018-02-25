class YelpService

  def initialize(params)
    @conn = Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
      f.headers['Authorization'] = "Bearer #{ENV["YELP_KEY"]}"
      f.adapter  Faraday.default_adapter
    end
    gather_results(params)
  end

  def return_info
    if result_by_phone[:id] == result_by_name_location[:id]
      parse_result(result_by_phone)
    else
      {}
    end
  end

  private

    attr_reader :conn, :result_by_phone, :result_by_name_location

    def gather_results(params)
      @result_by_phone ||= search_by_phone(params[:phone])
      @result_by_name_location ||= search_by_name_and_location(params[:name], params[:longitude], params[:latitude])
    end

    def search_by_phone(phone)
      response = conn.get "phone", { phone: ("+" + phone) }
      result = JSON.parse(response.body, symbolize_names: true)
      result[:businesses].first
    end

    def search_by_name_and_location(name, longitude, latitude)
      response = conn.get "", { term: name, longitude: longitude, latitude: latitude }
      result = JSON.parse(response.body, symbolize_names: true)
      result[:businesses].first
    end

    def parse_result(result)
      {
        rating: result[:rating],
        review_count: result[:review_count],
        yelp_url: result[:url],
      }
    end

end
