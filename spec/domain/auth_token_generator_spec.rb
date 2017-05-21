require 'rails_helper'

describe AuthTokenGenerator do
  describe ".generate" do
    it "should save new auth token in db for user session" do
      user = create :user

      expect do
        described_class.new(user, {}, "api").generate
      end.to change(AuthenticationToken, :count).from(0).to(1)
    end
  end
end
