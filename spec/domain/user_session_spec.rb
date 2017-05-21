require 'rails_helper'

RSpec.describe UserSession do
  describe "API Session" do
    it "should return not success on bad creds" do
      session_creator = described_class.for("application/json").new
      expect(session_creator.successful?).to be_falsey
    end

    it "should return auth token on successful creds" do
      user = create :user

      session_creator = described_class.for("application/json").new(
        params: { email: user.email, password: user.password },
        headers: { 'HTTP_USER_AGENT' => 'Chrome' },
      )

      expect(session_creator.successful?).to be_truthy
      expect(session_creator.authToken).to_not be_empty
    end
  end

  describe "Web Session" do
    it "should not be successful on incorect creds" do
      session_creator = described_class.for("text/html").new

      expect(session_creator.successful?).to be_falsey
    end

    it "should return successful on correct creds" do
      user = create :user
      session = {}

      session_creator = described_class.for("text/html").new(
        params: { email: user.email, password: user.password },
        session: session,
      )

      expect(session_creator.successful?).to be_truthy
      expect(session["user.id"]).to eq user.id
    end
  end
end

