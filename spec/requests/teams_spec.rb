require 'rails_helper'

RSpec.describe "Teams" do
  describe "API" do
    it "should be success" do
      token = AuthTokenGenerator.new(create(:user), 'iOS', 'api').generate
      get "/api/teams", headers: {
        'ACCEPT' => 'application/json',
        'Authorization' => "Bearer token=#{token}",
      }

      expect(JSON.parse(response.body)).to match({ "teams" => [] })
    end
  end
end
