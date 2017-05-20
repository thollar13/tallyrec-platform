require 'rails_helper'

RSpec.describe UserSession do
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

