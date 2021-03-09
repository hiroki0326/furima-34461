require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "GET /deliver" do
    it "returns http success" do
      get "/order/deliver"
      expect(response).to have_http_status(:success)
    end
  end

end
