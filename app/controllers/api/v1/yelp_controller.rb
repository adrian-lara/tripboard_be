class Api::V1::YelpController < ApplicationController

  def show
    service = YelpService.new(params)

    render json: service.return_info
  end

end
