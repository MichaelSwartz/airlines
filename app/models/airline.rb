class Airline < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search(query)
    where("name ilike :q or description ilike :q", q: "%#{query}%")
  end
end
