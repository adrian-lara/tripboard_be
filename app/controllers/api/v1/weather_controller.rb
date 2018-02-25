class Api::V1::WeatherController < ApplicationController

  def show
    service = WeatherService.new(params)

    render json: service.summary
  end

end
