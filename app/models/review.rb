class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :airline
  has_many :votes

  validates :rating, presence: true
  validates :airline, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1 }
  validates :rating, numericality: { less_than_or_equal_to: 4 }

  def self.search(query)
    where("body ilike :q", q: "%#{query}%")
  end

  def total_votes
    votes.sum(:value)
  end

  def summary
    self.body[0..30] || self.body
  end
end
