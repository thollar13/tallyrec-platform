require 'rails_helper'

RSpec.describe "App Logins" do
  describe "web login" do
    it "should return a session auth token on successful auth" do
      user = create(:user)

      post "/auth", params: { email: user.email, password: user.password }

      expect(response).to redirect_to team_dashboard_path
    end
  end
end
