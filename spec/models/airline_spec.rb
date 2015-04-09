require "rails_helper"

describe "airline" do
  describe "#average_rating" do
    it "should return zero when an airline has no reviews" do
      airline = FactoryGirl.create(:airline)
      expect(airline.average_rating).to eq 0
    end
  end
end
