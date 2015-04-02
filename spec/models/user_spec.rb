require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#reviews_by_airline" do
    context 'user has reviews' do
      user1 = FactoryGirl.create(:review).user

      it 'should return reviews namespaced by airline' do
        expect(user1.reviews_by_airline).to eq({user1.reviews.first.airline => [user1.reviews.first]})
      end
    end

    context 'user has no reviews' do
      it 'returns empty hash' do
        user_with_no_reviews = FactoryGirl.create(:user)
        expect(user_with_no_reviews.reviews_by_airline).to eq({})
      end
    end
  end
end
