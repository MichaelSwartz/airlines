describe "airline" do
  it "should return zero when an airline has no reviews" do
    airline = FactoryGirl.create(:airline)
    expect(airline.average_rating).to eq 0
  end
end
