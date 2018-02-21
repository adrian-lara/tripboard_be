class Api::V1::SearchPlacesController < ApplicationController

  def index
    service = SearchPlacesService.new

    render json: service.search(params[:q])
  end

end
