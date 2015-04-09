class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name ilike :q or description ilike :q", q: "%#{query}%")
  end

  def ratings
    ratings_array = []
    self.reviews.each do |review|
      ratings_array << review.rating
    end
    ratings_array
  end

  def average_rating
    sum = (self.ratings.inject (0) { |total, n| total + n }).to_f
    sum / ratings.count
  end

end
