class Api::V1::BasicInfoController < ApplicationController

  def show
    service = BasicInfoService.new

    render json: service.basic_info(params[:place_id])
  end

end
