require 'rails_helper'

RSpec.describe "SecretMenuItems", type: :request do
  describe "GET /show" do
    it "returns http success" do
      # this will perform a GET request to the /health/index route
      get "/secret_menu_items"

      # 'response' is a special object which contain HTTP response received after a request is sent
      # response.body is the body of the HTTP response, which here contain a JSON string
      expect(json_body.length).to eq(0)

      # we can also check the http status of the response
      expect(response).to have_http_status(:ok)
    end
  end
end
