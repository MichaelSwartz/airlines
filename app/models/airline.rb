class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name ilike :q or description ilike :q", q: "%#{query}%")
  end

  def average_rating
    return 0 if reviews.empty?
    sum = reviews.all.inject(0) do |total, review|
      total += review.rating
    end
    count = reviews.count
    sum.to_f / count
  end

  def self.sort_by_rating
    all.sort { |x, y| y.average_rating <=> x.average_rating }
  end
end
