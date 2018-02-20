class Api::V1::WelcomeController < ApplicationController

  def show
    render json: { message: "Welcome" }
  end

end
