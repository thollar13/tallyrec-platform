require 'rails_helper'

RSpec.describe UserSession do
  describe "Web Session" do
    it "should not be successful on incorect creds" do
      session_creator = described_class.for("text/html").new(
        {}, {}, {}
      )

      expect(session_creator.successful?).to eq false
    end

    it "should return successful on correct creds" do
      user = create :user

      session_creator = described_class.for("text/html").new(
        { email: user.email, password: user.password}, {}, {}
      )

      expect(session_creator.successful?).to eq true
    end
  end
end

