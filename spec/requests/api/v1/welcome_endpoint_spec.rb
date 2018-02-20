require 'rails_helper'

describe "Welcome Endpoint" do
  it "returns JSON with a key 'message' and a value of 'Welcome'" do
    get '/api/v1/welcome'

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json['message']).to eq('Welcome')
  end
end
