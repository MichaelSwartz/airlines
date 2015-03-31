class Airline < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
end
